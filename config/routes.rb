Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/subject", to: "subjects#new"
    post "/subject", to: "subjects#create"

    resources :users
    resources :subjects
    resources :questions
    resources :exams do
      resources :questions_exams, only: :create
    end
    resources :questions_exams
  end
end
