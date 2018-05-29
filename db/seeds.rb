if Rails.env.development?
  User.destroy_all
  Answer.destroy_all
  Question.destroy_all
  Disease.destroy_all
end

a = Faker::GameOfThrones.house
disease = Disease.create!(name: a, symptomes: Faker::GameOfThrones.city, latin_name: "#{a}um")
puts "#{disease.name} created!"

user = User.create!(firstname: "Jean", lastname: "Bonbeurre", email: "jeanbon@mail.com", password: "secret", disease: disease, location: "Paris, France", status_in_community: "Newbie", bio: Faker::GameOfThrones.quote, secu_nb: "1 23 04 69 666 666 11" )
puts "#{user.firstname} created!"

user2 = User.create!(firstname: "Jean", lastname: "Filemonpantalon", email: "jeanfile@mail.com", password: "secret", disease: disease, location: "Paris, France", status_in_community: "Newbie", bio: Faker::GameOfThrones.quote, secu_nb: "1 23 04 69 666 666 11" )
puts "#{user.firstname}2 created!"

question = Question.create!(title: "#{Faker::GameOfThrones.character} x #{Faker::GameOfThrones.character} real?", body: Faker::GameOfThrones.quote, disease: disease, user: user)
puts "#{question.title} created!"

question = Question.create!(title: "#{Faker::GameOfThrones.character} x #{Faker::GameOfThrones.character} real?", body: Faker::GameOfThrones.quote, disease: disease, user: user)
puts "#{question.title} created!"

answer = Answer.create!(body: Faker::GameOfThrones.quote, upvotes: rand(*[0..42]), question: question, user: user2)
puts "answer created!"

puts "Seed ok!"
