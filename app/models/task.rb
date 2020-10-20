# frozen_string_literal: true

class Task < ApplicationRecord
  # associations
  belongs_to :user
  has_one_attached :avatar

  # scopes
  scope :order_by_completed_at, -> { order('completed_at DESC') }
end
