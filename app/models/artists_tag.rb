# frozen_string_literal: true

class ArtistsTag < ApplicationRecord
  belongs_to :artist
  belongs_to :tag
end
