# frozen_string_literal: true

class BlogsTag < ApplicationRecord
  belongs_to :blog
  belongs_to :tag
end
