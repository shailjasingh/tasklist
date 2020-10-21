# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.string :avatar_url
      t.datetime :completed_at
      t.references :user, foreign_key: true
      t.timestamps

      # adds indexing to completed_at field
      t.index :completed_at
    end
  end
end
