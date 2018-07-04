
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
    latin_name: "#{a}um",
    disease_explanation: "Le diabète est une maladie qui empêche le corps d'utiliser correctement l'énergie fournie par les aliments ingérés. Par ailleurs, la maladie survient lorsque le pancréas ne sécrète plus d'insuline ou lorsque le corps devient résistant à l'insuline produite.

Lorsque nous mangeons, les aliments sont dégradés en glucose (sucre). Ce glucose fournit de l'énergie au corps afin qu'il puisse fonctionner correctement en puisant dans ses ressources. Pendant la digestion, le sang transporte le glucose dans tout le corps et vient alimenter les cellules. Cependant, pour que le sucre présent dans le sang puisse ensuite être transmis aux cellules, le corps a besoin d'insuline, une hormone sécrétée par le pancréas. L'insuline agit donc comme une clé permettant au glucose de passer du sang aux cellules de notre corps.

Chez les personnes diabétiques, une défaillance entre en jeu : le pancréas ne produit pas assez d'insuline pour remplir cette mission. Le glucose reste alors dans le sang et ne peut pas passer dans les cellules. Il ne peut donc pas fournir d'énergie aux muscles du corps.

Si le glucose reste dans le sang, la glycémie augmente. À long terme, cela peut entraîner le dysfonctionnement et la détérioration de nombreux organes comme les yeux et les reins.",
    usual_medication: "Chez les personnes diabétiques de type 1, le pancréas ne sécrète plus d'insuline. Les personnes atteintes d’un diabète de type 1 doivent apporter de l'insuline à leur organisme pour réguler leur glycémie (taux de sucre dans le sang) pour permettre au corps d'utiliser correctement le glucose ingéré. L’insuline ne peut pas être ingérée (par ex. sous forme de comprimés) car elle serait digérée comme n'importe quel aliment et détruite par l'acide de l'estomac. Elle doit être injectée par voie cutanée pour passer dans le sang.

Chez les personnes avec un diabète de type 2, en revanche, l'organisme sécrète de l'insuline, mais ne l'utilise pas correctement. Sans insuline, le glucose reste dans le sang. Or des taux de glycémie constamment élevés peuvent provoquer différents types de dommages à l'organisme.

Chaque personne souffrant d'un diabète est unique et les facteurs qui régissent sa maladie et son style de vie ont un impact sur le traitement. Plusieurs sortes d'insuline sont disponibles : elles diffèrent en termes de conception, de fonctionnement et de coût. La quasi-totalité des insulines actuelles sont fabriquées par imitation de l'insuline humaine (insulines de synthèse). "
  )
  puts "#{disease.name} created!"

# CREATING 10 USERS

  firstname1 = "Tiago"
  user1 = User.create!(
    firstname: firstname1,
    lastname: Faker::OnePiece.island,
    email: "#{firstname1}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user1.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ne5jwxwgjjpcig0q6hds.jpg"
  user1.save
  puts "#{user1.firstname} created!"

  firstname2 = "Marc"
  user2 = User.create!(
    firstname: firstname2,
    lastname: Faker::OnePiece.island,
    email: "#{firstname2}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user2.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/giirlbhp92mlrrqcadi6.jpg"
  user2.save
  puts "#{user2.firstname} created!"

  firstname3 = "Laurent"
  user3 = User.create!(
    firstname: firstname3,
    lastname: Faker::OnePiece.island,
    email: "#{firstname3}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user3.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/pvgdcafyubjbsqm00slm.jpg"
  user3.save
  puts "#{user3.firstname} created!"

  firstname4 = "Thibault"
  user4 = User.create!(
    firstname: firstname4,
    lastname: Faker::OnePiece.island,
    email: "#{firstname4}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user4.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ajhwwcp5g0rjrjybky0v.jpg"
  user4.save
  puts "#{user4.firstname} created!"

  firstname5 = "Herve"
  user5 = User.create!(
    firstname: firstname5,
    lastname: Faker::OnePiece.island,
    email: "#{firstname5}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user5.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/akl8fhx69ezqb0vk62zk.jpg"
  user5.save
  puts "#{user5.firstname} created!"

  firstname6 = "Sophie"
  user6 = User.create!(
    firstname: firstname6,
    lastname: Faker::OnePiece.island,
    email: "#{firstname6}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user6.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/h16ouwa2bz1faf4gxgpe.jpg"
  user6.save
  puts "#{user6.firstname} created!"

  firstname7 = "Solange"
  user7 = User.create!(
    firstname: firstname7,
    lastname: Faker::OnePiece.island,
    email: "#{firstname7}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user7.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/p2sykhfbnarhxatd9avz.jpg"
  user7.save
  puts "#{user7.firstname} created!"

  firstname8 = "Etienne"
  user8 = User.create!(
    firstname: firstname8,
    lastname: Faker::OnePiece.island,
    email: "#{firstname8}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user8.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/enuja2tvfqfcvflivb8s.jpg"
  user8.save
  puts "#{user8.firstname} created!"

  firstname9 = "Tom"
  user9 = User.create!(
    firstname: firstname9,
    lastname: Faker::OnePiece.island,
    email: "#{firstname9}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user9.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/lqupe9b6grukw2wwrvgj.jpg"
  user9.save
  puts "#{user9.firstname} created!"

  firstname10 = "Karl"
  user10 = User.create!(
    firstname: firstname10,
    lastname: Faker::OnePiece.island,
    email: "#{firstname10}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user10.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/jjdda3qjv7gpodd4u5ov.jpg"
  user10.save
  puts "#{user10.firstname} created!"


  firstname11 = "Marie"
  user11 = User.create!(
    firstname: firstname11,
    lastname: Faker::OnePiece.island,
    email: "#{firstname11}@gmail.com",
    password: "secret",
    disease: disease,
    location: Faker::Address.city,
    status_in_community: "Newbie",
    bio: Faker::Lorem.paragraph,
    secu_nb: "1 23 04 69 666 666 11"
  )
  user11.remote_photo_url = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/p2sykhfbnarhxatd9avz.jpg"
  user11.save
  puts "#{user11.firstname} created!"


# CREATING 10 QUESTIONS


  question1 = Question.create!(
    title: "L’incroyable défi d’Haka, ado diabétique de 13 ans",
    body: "Son diabète de type 1 l’a plongé il y a deux ans dans le coma. Pas de quoi arrêter Haka. L’ado de 13 ans va parcourir 2 000 km en courant et à vélo, comme un pied de nez à sa maladie",
    disease: disease,
    user: user1
  )
  puts "#{question1.title} created!"

  question2 = Question.create!(
    title: "Le rôle du thymus n’est pas celui que l’on croyait !",
    body: "C’est une petite révolution dans le monde de la recherche sur le diabète de type 1 : une étude menée par l’équipe Inserm dirigée par Roberto Mallone à l’Institut Cochin (Inserm, CNRS, Université Paris Descartes), remet en question le rôle attribué de longue date au thymus dans la sélection et l’élimination des globules blancs associés au diabète de type 1 et révèle que nous sommes tous auto-immuns.",
    disease: disease,
    user: user1
  )
  puts "#{question2.title} created!"

  question3 = Question.create!(
    title: "Diabète et alcool, danger?",
    body: "Vous prenez quoi comme drinks quand vous sortez? ",
    disease: disease,
    user: user3
  )
  puts "#{question3.title} created!"

  question4 = Question.create!(
    title: "Journée mondiale du diabète : comment y participer ?",
    body: " J’ai entendu parlé de cette journée dernièrement; des infos?",
    disease: disease,
    user: user5
  )
  puts "#{question4.title} created!"

  question5 = Question.create!(
    title: "Connaissez-vous le lecteur de glycémie Freestyle Optium Neo ?",
    body: " Il est parfois dur de s’y retrouver parmi tout les lecteurs, que pensez-vous de celui-ci?",
    disease: disease,
    user: user7
  )
  puts "#{question5.title} created!"

  question6 = Question.create!(
    title: "Des noms de gynéco pro du diabète 1 sur Paris?",
    body: "Je suis nouvelle en ville du coup je cherche le bon doc!",
    disease: disease,
    user: user7
  )
  puts "#{question6.title} created!"

  question7 = Question.create!(
    title: "Pillule + Diabète?",
    body: "Vous prenez quoi comme pillule?",
    disease: disease,
    user: user6
  )
  puts "#{question7.title} created!"

  question8 = Question.create!(
    title: "Mains sèches et Humalog",
    body: "Je galère à trouver des bonnes crèmes pour les mains avec Humalog",
    disease: disease,
    user: user10
  )
  puts "#{question8.title} created!"

  question9 = Question.create!(
    title: "Insulines et lieu public..",
    body: "Des tips pour être discret? Ca fait que 2 mois que j'ai commencé... ",
    disease: disease,
    user: user9
  )
  puts "#{question9.title} created!"

  question10 = Question.create!(
    title: "Est-il possible de vivre sans insuline avec le diabète?",
    body: "J’ai entendu parler de ça au JT l’autre soir, quelqu’un aurait-il des informations complémentaires?",
    disease: disease,
    user: user8
  )
  puts "#{question10.title} created!"

  question11 = Question.create!(
    title: "Des conseils alimentaires (glycémie)?",
    body: "Détails: J'aimerai avoir vos avis concernant une alimentation saine vis-à-vis de la glycémie",
    disease: disease,
    user: user8
  )
  puts "#{question11.title} created!"


# CREATING 20 ANSWERS

  answer1_2_1 = Answer.create!(
      body: "Quelle belle avancée !! Reste à mieux identifier la source de ce basculement qui nous fait passer de l'auto-immun bénin à DT1.",
      upvotes: rand(*[0..42]),
      question: question2,
      user: user4
    )
  puts "answers created!"

  answer2_2_3 = Answer.create!(
      body: "Je vais suivre ça!",
      upvotes: rand(*[0..42]),
      question: question2,
      user: user3
    )
  puts "answers created!"

  answer3_1_1 = Answer.create!(
      body: "Quelle belle histoire! ",
      upvotes: rand(*[0..42]),
      question: question1,
      user: user5
    )
  puts "answers created!"

  answer4_4_3 = Answer.create!(
      body: "Elle a lieu tout les 14 novembre, tu peux t’inscrire sur le site de l’IDF (international Diabetes Federation)",
      upvotes: rand(*[0..42]),
      question: question4,
      user: user3
    )
  puts "answers created!"

  answer5_7_7 = Answer.create!(
      body: "Je prends cerazette c'est parfait car synthèse d'hormones naturelles ! ",
      upvotes: rand(*[0..42]),
      question: question7,
      user: user7
    )
  puts "answers created!"

  answer6_7_6 = Answer.create!(
      body: "Moi aussi je suis sur Cerazette! Tout à fait d'accord c'est super!",
      upvotes: rand(*[0..42]),
      question: question7,
      user: user11
    )
  puts "answers created!"

  answer7_9_3 = Answer.create!(
      body: "J'essaie de faire ça à la maison... un peu triste",
      upvotes: rand(*[0..42]),
      question: question9,
      user: user3
    )
  puts "answers created!"

  answer8_9_5 = Answer.create!(
      body: "Au pire au toilettes mais bon après il faut s'y habituer tu verras ça ira mieux bientôt :)",
      upvotes: rand(*[0..42]),
      question: question9,
      user: user1
    )
  puts "answers created!"

  answer9_8_7 = Answer.create!(
      body: "Avène power!! définitivement les meilleures :)",
      upvotes: rand(*[0..42]),
      question: question8,
      user: user7
    )
  puts "answers created!"

  answer10_8_9 = Answer.create!(
      body: "La gamme Même est vraiment bien",
      upvotes: rand(*[0..42]),
      question: question8,
      user: user9
    )
  puts "answers created!"


  answer11_ = Answer.create!(
      body: "Le gin est censé être le moins sucré des alcools fort et le cidre l'est moins que la bière!",
      upvotes: rand(*[0..42]),
      question: question3,
      user: user7
    )
  puts "answers created!"

   answer12_ = Answer.create!(
      body: "Je recommande vivement le Dr Hocquemiller dans le 5ème à Paris",
      upvotes: rand(*[0..42]),
      question: question6,
      user: user11
    )
  puts "answers created!"

   answer13_ = Answer.create!(
      body: "Salut Etienne, consomme en priorité fruits et légumes, évite à tout prix les produits transformés industriels, ils sont bourrés de sucre! Je te conseille plus particulièrement l'avocat, il aide à réguler la glycémie lors de la digestion.",
      upvotes: rand(*[0..42]),
      question: question8,
      user: user11
    )
  puts "answers created!"

   answer14_ = Answer.create!(
      body: "Comme le dit Marie, les produits industriels sont notre ennemi n°1!! Rien n'est meilleur que de se faire à manger soit-même avec des produits frais. Il faut également varier son alimentation et boire de l'eau en quantité suffisante, c'est la clef de la santé ;)",
      upvotes: rand(*[0..42]),
      question: question8,
      user: user7
    )
  puts "answers created!"

   answer15_ = Answer.create!(
      body: "FreeStyle Optium Neo est un lecteur de glycémie destiné à l'autosurveillance de la glycémie et de la cétonémie à domicile ou bien pour l'utilisation par des professionnels de santé. Afin de suivre parfaitement votre glycémie, il vous sera possible de transférer vos résultats sur ordinateur, via le câble USB fourni avec votre lecteur de glycémie. Le lecteur de glycémie FreeStyle Optium Neo est également capable d'enregistrer un maximum de 1000 évènements.",
      upvotes: rand(*[0..42]),
      question: question5,
      user: user8
    )
  puts "answers created!"

   answer16_ = Answer.create!(
      body: "Alors que l'on pensait l'insuline indispensable à la vie des mammifères, il a été montré que des souris déficientes en cette hormone pouvaient survivre. Mais pour cela, elles ont besoin de leptine, une autre hormone impliquée dans le métabolisme. Une piste à creuser pour déterminer si l'on peut remplacer l'insuline qui provoque quelques effets secondaires, dans le traitement du diabète.",
      upvotes: rand(*[0..42]),
      question: question10,
      user: user3
    )
  puts "answers created!"

   answer13_ = Answer.create!(
      body: "J'y suis allée l'année dernière c'était super intéressant avec plein de bons intervenants.",
      upvotes: rand(*[0..42]),
      question: question4,
      user: user2
    )
  puts "answers created!"

   answer13_ = Answer.create!(
      body: "C'est assez difficile d'en trouver qui s'y connaissent sur le diabète mais je recommande l'institut Alfred Fournier",
      upvotes: rand(*[0..42]),
      question: question6,
      user: user7
    )
  puts "answers created!"

# Admin creation
admin = User.create!(firstname: "Admin", lastname: "Admin", email: "admin@gmail.com", password: "password", disease: disease, location: "Admin", status_in_community: "God", bio: "Admin", secu_nb: "1 23 04 69 666 666 11", admin: true)
puts "#{admin.firstname} #{admin.lastname} created!"

  # adding their slackname


puts "Seed ok!"


# Scrapping for the Disease


Question.search_index.delete
Answer.search_index.delete

Question.reindex
Answer.reindex
