# frozen_string_literal: true

class CreateArtworksTags < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks_tags do |t|
      t.belongs_to :artwork, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
