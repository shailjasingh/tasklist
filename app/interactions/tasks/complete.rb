# frozen_string_literal: true

module Tasks
  class Complete < ActiveInteraction::Base
    object :task

    validates :task, presence: true
    validate :task_completion

    def execute
      task.completed_at = Time.zone.now
      errors.merge!(task.errors) unless task.save
      task
    end

    private

    def task_completion
      errors.add(:task, I18n.t('task.messages.errors.already_completed')) if task.completed_at
    end
  end
end
