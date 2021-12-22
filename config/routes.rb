Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "users/:id", to: "users#show", as: :single_user
    get "/subject", to: "subjects#new"
    post "/subject", to: "subjects#create"

    devise_for :users, controllers: {sessions: "sessions"}
    resources :users, only: %i(show edit update)
    resources :subjects
    resources :questions
    resources :exams do
      resources :questions_exams, only: :create
    end
    resources :questions_exams
  end
end
