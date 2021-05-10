# frozen_string_literal: true

class CreateTrackings < ActiveRecord::Migration[6.0]
  def change
    create_table :trackings do |t|
      t.references :task, null: false, foreign_key: true
      t.datetime :date
      t.integer :type
      t.float :temperature

      t.timestamps
    end
  end
end
