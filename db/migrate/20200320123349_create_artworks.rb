# frozen_string_literal: true

class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.belongs_to :artist, index: true
      t.string :title
      t.text :description
      t.string :dimension
      t.timestamps
    end
  end
end
