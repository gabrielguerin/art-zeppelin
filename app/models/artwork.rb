# frozen_string_literal: true

class Artwork < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :artist
  has_many_attached :images
  has_many :artworks_tags, dependent: :destroy
  has_many :tags, through: :artworks_tags
end
