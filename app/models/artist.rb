# frozen_string_literal: true

class Artist < ApplicationRecord
  searchkick
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  has_one_attached :avatar

  has_many :artworks
  has_many :artists_tags, dependent: :destroy
  has_many :tags, through: :artists_tags
  has_many :projects, dependent: :destroy
  has_many :clients, through: :projects

  def full_name
    "#{first_name} #{last_name}"
  end
end
