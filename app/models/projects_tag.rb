# frozen_string_literal: true

class ProjectsTag < ApplicationRecord
  belongs_to :project
  belongs_to :tag
end
