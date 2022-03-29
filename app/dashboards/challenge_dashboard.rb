require "administrate/base_dashboard"

class ChallengeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    challenge_members: Field::HasMany,
    main_challenge_picture: Field::ActiveStorage.with_options(
      show_preview_size: [200, 200],
      destroy_url: proc do |namespace, resource, attachment|
        [:main_challenge_picture_admin_challenge, { attachment_id: attachment.id }]
      end
    ),
    challenge_3d_model: Field::ActiveStorage,
    id: Field::Number,
    title: Field::String,
    description: Field::String,
    status: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    members_count: Field::Number,
    duration: Field::Number,
    link: Field::String,
    money_prize: Field::Number.with_options(decimals: 2),
    val: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    type_of_print: Field::Select.with_options(searchable: false, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    challenge_members
    title
    status
    money_prize
    main_challenge_picture
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    challenge_members
    main_challenge_picture
    challenge_3d_model
    id
    title
    description
    status
    members_count
    duration
    link
    money_prize
    val
    type_of_print
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    challenge_members
    main_challenge_picture
    challenge_3d_model
    title
    description
    status
    members_count
    duration
    link
    money_prize
    val
    type_of_print
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how challenges are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(challenge)
  #   "Challenge ##{challenge.id}"
  # end
end
