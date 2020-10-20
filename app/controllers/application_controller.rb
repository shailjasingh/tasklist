# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def current_user
    # TODO: : This needs to be handled by session
    User.first
  end
end
