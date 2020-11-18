# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.create!(
  name: 'test',
  email: 'test@test',
  password: 'aaaaaa'
)

80.times do |n|
  Book.create!(
    title: "book#{n}",
    description: "test test#{n}",
    user_id: 1
  )
end
