# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :owner, references: :users
      t.timestamps
    end
  end
end
