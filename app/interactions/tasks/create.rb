# frozen_string_literal: true

require 'open-uri'

module Tasks
  class Create < ActiveInteraction::Base
    string :description, :avatar_url
    object :user

    validates :description, :user, presence: true

    def execute
      task = user.tasks.new(inputs)

      if avatar_url.present?
        unless remote_image_exists?(avatar_url)
          return errors.add(:avatar_url, I18n.t('task.messages.errors.avatar_url', url: avatar_url))
        end

        task = attach_file_to_task(task)
      end
      errors.merge!(task.errors) unless task.save
      task
    rescue StandardError => e
      Rails.logger.error("Error while creating task #{e.message} #{e.backtrace}")
      errors.add(:exception, I18n.t('task.messages.errors.exception'))
    end

    private

    def attach_file_to_task(task)
      uri = URI.parse(avatar_url)
      filename = File.basename(uri.path)
      file = uri.open
      task.avatar.attach(io: file, filename: filename)
      task
    end

    def remote_image_exists?(url)
      UrlParser.remote_file_exists?(url)
    rescue Errors::InvalidUrlError
      false
    rescue Errors::InvalidImageUrlError
      false
    end
  end
end
