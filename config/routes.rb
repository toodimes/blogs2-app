Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end

  root to: "posts#index"

  # Posts
  get "/posts/new" => "posts#new"
  post "/posts" => "posts#create"

  get "posts/:id/like" => 'posts#like'

  get "/posts/:id" => "posts#show"

  get "/posts/:id/edit" => "posts#edit"
  patch "/posts/:id" => "posts#update"

  delete "/posts/:id" => "posts#destroy"
  # End Posts
end
