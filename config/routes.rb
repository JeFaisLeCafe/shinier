Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :questions do
    get 'toggle', to: 'questions#toggle_answered', as: :toggle
    resources :answers
  end
  resources :diseases, except: [ :destroy ]
  resources :answers do
    member do
      put "like", to: "answers#upvote"
      put "dislike", to: "answers#downvote"
    end
  end
  get "user_home", to: "pages#user_home"
  resources :users
  # get "/questions/:id", to: "questions#mark_as_answered", as: :answered
end
