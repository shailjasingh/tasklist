# frozen_string_literal: true

module ApplicationHelper
  def image_url(avatar)
    avatar.present? ? url_for(avatar) : 'default.png'
  end
end
