Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  get '/clients', to: 'home#clients'
  get '/services', to: 'home#services'
  get '/about', to: 'home#about'
  get '/contact', to: 'home#contact'
  get '/writeitwell', to: 'home#writeitwell'

  get 'new_homepage', to: 'home#new_homepage'

  resources :articles, only: [:index, :show]

  namespace :admin do
    root to: "articles#index"

    resources :articles
  end

  root 'home#index'

  match '/' => 'home#create', :as => 'message', :via => :post

end
