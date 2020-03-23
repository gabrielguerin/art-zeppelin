# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :client, index: true
      t.datetime :date
      t.text :description
      t.timestamps
    end
  end
end
