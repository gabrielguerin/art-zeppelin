# frozen_string_literal: true

class Blog < ApplicationRecord
  searchkick word_start: %i[title description]
  extend FriendlyId  
  friendly_id :title, use: :slugged
  has_rich_text :body
  has_one_attached :cover

  belongs_to :user
  has_many :blogs_tags, dependent: :destroy
  has_many :tags, through: :blogs_tags
end
