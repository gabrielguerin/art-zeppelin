# frozen_string_literal: true

class CreateProjectsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :projects_tags do |t|
      t.belongs_to :project, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
