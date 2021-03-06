ETouhou::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => "home#index"
  #resources :pages


  resources :comics do
    resources :pages do
      resources :bilis
    end
    resources :comments
  end

  match 'tags' => 'comics#tag_cloud'
  match 'tags/:tag' => 'comics#tagged', :as => 'tagged'

  resources :comments


  resources :characters


  resources :categories


  authenticated :user do
    root :to => 'comics#index'
  end
  #root :to => "comics#index"
  devise_for :users
  resources :users
end