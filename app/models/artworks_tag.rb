# frozen_string_literal: true

class ArtworksTag < ApplicationRecord
  belongs_to :artwork
  belongs_to :tag
end
