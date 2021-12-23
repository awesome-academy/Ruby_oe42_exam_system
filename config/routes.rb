Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/subject", to: "subjects#new"
    post "/subject", to: "subjects#create"
    get "/sign_up", to: "users#new"
    post "/sign_up", to: "users#create"

    devise_for :users, controllers: {sessions: "sessions"}
    resources :users
    resources :subjects
    resources :questions
    resources :exams do
      resources :questions_exams, only: :create
    end
    resources :questions_exams
  end
end
