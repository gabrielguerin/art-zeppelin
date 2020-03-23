# frozen_string_literal: true

class Client < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  belongs_to :company
  has_one_attached :avatar

  has_many :projects, dependent: :destroy
  has_many :artists, through: :projects

  def full_name
    "#{first_name} #{last_name}"
  end
end
