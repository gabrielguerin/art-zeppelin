# frozen_string_literal: true

class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  has_many :artworks
  has_many :artists_tags, dependent: :destroy
  has_many :tags, through: :artists_tags
  has_many :projects

  def full_name
    "#{first_name} #{last_name}"
  end
end
