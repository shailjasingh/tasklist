# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.timestamps

      # adds indexing to email field
      t.index :email, unique: true
      # adds indexing to username field
      t.index :username, unique: true
    end
  end
end
