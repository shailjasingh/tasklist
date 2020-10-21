module Tasks
  class Find < ActiveInteraction::Base
    integer :task_id

    validates :task_id, presence: true

    def execute
      task = Task.find_by_id(task_id)
      task || errors.add(:task_id, I18n.t('task.messages.errors.not_exist'))
    end
  end
end
