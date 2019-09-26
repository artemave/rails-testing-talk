# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/http_client'

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, args: %w[headless])
end

class SeleniumHttpClient
  def self.post(url, *args)
    uri = URI.parse(url)
    uri.port = Capybara.current_session.server.port

    RestClient.post uri.to_s, *args
  end
end

class RackTestHttpClient
  def self.post(*args)
    rack_test_driver = Capybara.current_session.driver
    rack_test_driver.post *args
  end
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  def self.js?
    ENV['JS'] || ENV['GUI']
  end

  driver = js? ? :selenium : :rack_test
  driven_by driver, using: ENV['GUI'].present? ? :chrome : :headless_chrome, screen_size: [1400, 1400]

  HttpClient.client = if js?
                        SeleniumHttpClient
                      else
                        RackTestHttpClient
                      end
end
