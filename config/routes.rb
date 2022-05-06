Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  
  get "search" => "searches#search"

  resources :post_images,only:[:new, :create, :index, :show, :destroy] do
    resources :post_comments,only:[:create,:destroy]
    resource :favorites,only:[:create,:destroy]
  end
  resources :users,only:[:show, :edit, :update, :index] do
    resource :relationships,only:[:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
