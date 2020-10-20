# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    # TODO: : This needs to be handled by session
    User.first
  end
end
