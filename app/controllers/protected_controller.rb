# every other controller!!!! except AuthController should inherit from this

class ProtectedController < ApplicationController
  before_action :authenticate

  private

  attr_reader :current_user

  def set_current_user token
     @current_user = User.find_by token: token
  end

  def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        set_current_user token
      end

  end


end
