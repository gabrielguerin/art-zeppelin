# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :blogs

  def full_name
    "#{first_name} #{last_name}"
  end
end
