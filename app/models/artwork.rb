# frozen_string_literal: true

class Artwork < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :artist
end
