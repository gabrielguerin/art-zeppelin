# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Use faker to seed
require 'faker'

# Delete everything
User.delete_all
Tag.delete_all
Artist.delete_all
ArtistsTag.delete_all
Artwork.delete_all
ArtworksTag.delete_all
Blog.delete_all
BlogsTag.delete_all
Client.delete_all
Company.delete_all
Project.delete_all
ProjectsTag.delete_all

# Seed
5.times do
  @user = User.create!(
    first_name: Faker::Name.first_name,

    last_name: Faker::Name.last_name,

    gender: Faker::Gender.binary_type,

    email: Faker::Internet.email,

    admin: 'true',

    password: 'password'
  )
  @user.avatar.attach(
    io: File.open('app/assets/images/seed/avatar_01.jpg'),
    filename: 'avatar_01.jpg',
    content_type: 'image/jpg',
    identify: false
  )
end

20.times do
  Tag.create!(
    title: Faker::Nation.language
  )
end

50.times do
  @blog = Blog.create!(
    user: User.all.sample,

    title: Faker::BossaNova.song,

    tags: Tag.all.sample(3),

    description: Faker::Movies::VForVendetta.quote,

    body: Faker::Lorem.paragraphs
  )
  @blog.cover.attach(
    io: File.open('app/assets/images/seed/blog_cover.jpg'),
    filename: 'blog_cover.jpg',
    content_type: 'image/jpg',
    identify: false
  )
end

50.times do
  @artist = Artist.create!(
    first_name: Faker::Name.first_name,

    last_name: Faker::Name.last_name,

    gender: Faker::Gender.binary_type,

    email: Faker::Internet.email,

    telephone: Faker::PhoneNumber.phone_number_with_country_code,

    description: Faker::Lorem.paragraph
  )
  @artist.avatar.attach(
    io: File.open('app/assets/images/seed/avatar_02.jpg'),
    filename: 'avatar_02.jpg',
    content_type: 'image/jpg',
    identify: false
  )
end

100.times do
  @artwork = Artwork.create!(
    artist: Artist.all.sample,

    title: Faker::Lorem.sentence,

    description: Faker::Lorem.paragraph,

    dimension: Faker::Number.number(digits: 2)
  )
  @artwork.images.attach(
    io: File.open('app/assets/images/seed/artwork_01.jpg'),
    filename: 'artwork_01.jpg',
    content_type: 'image/jpg',
    identify: false
  )
end

20.times do
  Company.create!(
    name: Faker::Company.name,

    address: Faker::Address.full_address,

    size: Faker::Number.number(digits: 3),

    category: Faker::Company.industry
  )
end

50.times do
  @client = Client.create!(
    company: Company.all.sample,

    first_name: Faker::Name.first_name,

    last_name: Faker::Name.last_name,

    gender: Faker::Gender.binary_type,

    email: Faker::Internet.email,

    telephone: Faker::PhoneNumber.phone_number_with_country_code,

    comment: Faker::Lorem.paragraph
  )
  @client.avatar.attach(
    io: File.open('app/assets/images/seed/avatar_03.jpg'),
    filename: 'avatar_03.jpg',
    content_type: 'image/jpg',
    identify: false
  )
end

100.times do
  Project.create!(
    artist: Artist.all.sample,

    client: Client.all.sample,

    date: Faker::Date.forward(days: 365)
  )
end

100.times do
  ProjectsTag.create!(
    project: Project.all.sample,

    tag: Tag.all.sample
  )
end

50.times do
  BlogsTag.create!(
    blog: Blog.all.sample,

    tag: Tag.all.sample
  )
end

100.times do
  ArtworksTag.create!(
    artwork: Artwork.all.sample,

    tag: Tag.all.sample
  )
end

50.times do
  ArtistsTag.create!(
    artist: Artist.all.sample,

    tag: Tag.all.sample
  )
end
