# frozen_string_literal: true

require 'administrate/base_dashboard'

class ClientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    company: Field::BelongsTo,
    projects: Field::HasMany,
    avatar: Field::ActiveStorage,
    artists: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    email: Field::String,
    job: Field::String,
    gender: Field::String,
    address: Field::String,
    telephone: Field::String,
    comment: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    first_name
    last_name
    gender
    email
    job
    company
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    avatar
    first_name
    last_name
    gender
    email
    telephone
    job
    company
    address
    comment
    projects
    artists
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    avatar
    first_name
    last_name
    gender
    email
    telephone
    job
    company
    address
    comment
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

  # Overwrite this method to customize how clients are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(client)
    "#{client.first_name} #{client.last_name}"
  end
end
