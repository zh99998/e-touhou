ETouhou::Application.routes.draw do
  root :to => "comics#index"
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
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end