Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "up" => "rails/health#show", as: :rails_health_check
  
  devise_for :users
  resources :blog_posts

  get "blog_posts", to: "blog_posts#index"
  get "about" => "pages#about", as: :about

  # Defines the root path route ("/")
  root "blog_posts#index", as: :root
end
