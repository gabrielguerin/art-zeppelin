# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :artist

  belongs_to :client

  has_many :projects_tags, dependent: :destroy

  has_many :tags, through: :projects_tags
end
