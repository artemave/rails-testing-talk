# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action do
    Apartment::Tenant.switch! 'tenant1' if Rails.env.test?
  end
end
