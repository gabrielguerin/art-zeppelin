# frozen_string_literal: true

class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :projects_tags, dependent: :destroy
  has_many :projects, through: :projects_tags
  has_many :blogs_tags, dependent: :destroy
  has_many :blogs, through: :blogs_tags
  has_many :artists_tags, dependent: :destroy
  has_many :artists, through: :artists_tags
  has_many :artworks_tags, dependent: :destroy
  has_many :artworks, through: :artworks_tags
end
