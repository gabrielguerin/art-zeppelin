require "administrate/base_dashboard"

class ArtistDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artworks: Field::HasMany,
    artists_tags: Field::HasMany,
    tags: Field::HasMany,
    projects: Field::HasMany,
    clients: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    gender: Field::String,
    email: Field::String,
    telephone: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  artworks
  artists_tags
  tags
  projects
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  artworks
  artists_tags
  tags
  projects
  clients
  id
  first_name
  last_name
  gender
  email
  telephone
  description
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  artworks
  artists_tags
  tags
  projects
  clients
  first_name
  last_name
  gender
  email
  telephone
  description
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how artists are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(artist)
  #   "Artist ##{artist.id}"
  # end
end
