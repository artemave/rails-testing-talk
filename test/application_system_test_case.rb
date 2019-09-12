# frozen_string_literal: true

require 'test_helper'

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, args: %w[headless])
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: ENV['GUI'].present? ? :chrome : :headless_chrome, screen_size: [1400, 1400]
end
