# frozen_string_literal: true

class Company < ApplicationRecord
  searchkick
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :clients
end
