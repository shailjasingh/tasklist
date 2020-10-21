# frozen_string_literal: true

class User < ApplicationRecord
  # associations
  has_many :tasks, dependent: :destroy

  # validations
  # TODO:: Need to handle validations at service layer when it will be introduced
  validates :username, :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :username, uniqueness: true
end
