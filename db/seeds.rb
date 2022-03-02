require 'faker'

100.times do
    Book.create!(
        title: Faker::Book.title,
        author: Faker::Book.author,
        genre: Faker::Book.genre,
        isbn: Faker::Code.isbn,
        language: Faker::Nation.language
    )
end