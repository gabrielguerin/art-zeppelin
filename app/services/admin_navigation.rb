# frozen_string_literal: true

class AdminNavigation
  # Set pages to remove from Admin Dashboard's sidebar

  HIDDEN_PAGES = %w[artists_tags artworks_tags blogs_tags projects_tags].freeze

  def self.routes(admin)
    admin.resources.reject { |i| i.resource.in?(HIDDEN_PAGES) }
  end
end
