
if Rails.env.development?
  User.destroy_all
  Answer.destroy_all
  Question.destroy_all
  Disease.destroy_all
  puts "Destroying"
end


  a = Faker::GameOfThrones.house
  disease = Disease.create!(name: a, symptomes: Faker::GameOfThrones.city, latin_name: "#{a}um")
  puts "#{disease.name} created!"

10.times do
  user = User.create!(firstname: Faker::Cat.name, lastname: Faker::OnePiece.island, email: Faker::Internet.email, password: "secret", disease: disease, location: Faker::Address.city, status_in_community: "Newbie", bio: Faker::Lorem.paragraph, secu_nb: "1 23 04 69 666 666 11" )
  puts "#{user.firstname} created!"

  user2 = User.create!(firstname: Faker::Cat.name, lastname: Faker::OnePiece.island, email: Faker::Internet.email, password: "secret", disease: disease, location: Faker::Address.city, status_in_community: "Newbie", bio: Faker::Lorem.paragraph, secu_nb: "1 23 04 69 666 666 11" )
  puts "#{user2.firstname} created!"

  question = Question.create!(title: "#{Faker::GameOfThrones.character} x #{Faker::GameOfThrones.character} real?", body: Faker::GameOfThrones.quote, disease: disease, user: user)
  puts "#{question.title} created!"

  answer = Answer.create!(body: Faker::Hipster.paragraph, upvotes: rand(*[0..42]), question: question, user: user2)
  puts "answer created!"

  puts "Seed ok!"
end

Question.reindex
Disease.reindex
Answer.reindex
