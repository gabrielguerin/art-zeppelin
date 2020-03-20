# frozen_string_literal: true

class CreateArtistsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :artists_tags do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
