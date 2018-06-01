
if Rails.env.development?
  User.destroy_all
  Answer.destroy_all
  Question.destroy_all
  Disease.destroy_all
  puts "Destroying"
end


  a = "Diabete type 1"
  disease = Disease.create!(
    name: a,
    symptomes: "une augmentation du besoin d’uriner ; une augmentation de la soif (polydipsie) ; une perte de poids malgré un appétit qui augmente ;
                une fatigue importante ou une vision trouble",
    latin_name: "#{a}um"
  )
  puts "#{disease.name} created!"

# CREATING 10 USERS

  user1 = User.create!(
    firstname: Faker::Cat.name,
    lastname: Faker::OnePiece.island,
    email: Faker::Internet.unique.email,
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  puts "#{user.firstname} created!"

  user2 = User.create!(
    firstname: Faker::Cat.name,
    lastname: Faker::OnePiece.island,
    email: Faker::Internet.unique.email,
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  puts "#{user.firstname} created!"


  user3 = User.create!(
    firstname: Faker::Cat.name,
    lastname: Faker::OnePiece.island,
    email: Faker::Internet.unique.email,
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  puts "#{user.firstname} created!"

  user4 = User.create!(
    firstname: Faker::Cat.name,
    lastname: Faker::OnePiece.island,
    email: Faker::Internet.unique.email,
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  puts "#{user.firstname} created!"



  question1 = Question.create!(
    title: "L’incroyable défi d’Haka, ado diabétique de 13 ans",
    body: "Son diabète de type 1 l’a plongé il y a deux ans dans le coma. Pas de quoi arrêter Haka. L’ado de 13 ans va parcourir 2 000 km en courant et à vélo, comme un pied de nez à sa maladie",
    disease: disease,
    user: user1
  )
  puts "#{question.title} created!"

  question2 = Question.create!(
    title: "Le rôle du thymus n’est pas celui que l’on croyait !",
    body: "C’est une petite révolution dans le monde de la recherche sur le diabète de type 1 : une étude menée par l’équipe Inserm dirigée par Roberto Mallone à l’Institut Cochin (Inserm, CNRS, Université Paris Descartes), remet en question le rôle attribué de longue date au thymus dans la sélection et l’élimination des globules blancs associés au diabète de type 1 et révèle que nous sommes tous auto-immuns.",
    disease: disease,
    user: user1
  )
  puts "#{question.title} created!"

  answer_2_1 = Answer.create!(
      body: "Quelle belle avancée !! Reste à mieux identifier la source de ce basculement qui nous fait passer de l'auto-immun bénin à DT1.",
      upvotes: rand(*[0..42]),
      question: question2,
      user: user1
    )
  puts "answers created!"

  answer_2_1 = Answer.create!(
      body: "Quelle belle avancée !! Reste à mieux identifier la source de ce basculement qui nous fait passer de l'auto-immun bénin à DT1.",
      upvotes: rand(*[0..42]),
      question: question2,
      user: user3
    )
  puts "answers created!"


end

# Admin creation
admin = User.create!(firstname: "Jean", lastname: "Merdelémouch", email: "jean@mail.com", password: "azerty", disease: disease, location: "Lyon, France", status_in_community: "God", bio: "J'aime pas les mouches", secu_nb: "1 23 04 69 666 666 11", admin: true)
puts "#{admin.firstname} #{admin.lastname} created!"
puts "Seed ok!"

Question.search_index.delete
Answer.search_index.delete

Question.reindex
Answer.reindex
