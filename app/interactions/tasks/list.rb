# frozen_string_literal: true

module Tasks
  class List < ActiveInteraction::Base
    object :user

    validates :user, presence: true

    def execute
      user.tasks.order_by_completed_at
    end
  end
end
