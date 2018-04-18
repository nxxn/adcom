Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  # get '/clients', to: 'home#clients'
  # get '/services', to: 'home#services'
  # get '/about', to: 'home#about'
  # get '/contact', to: 'home#contact'
  # get '/writeitwell', to: 'home#writeitwell'
  get '/write_it_well', to: 'home#write_it_well'
  get '/adcomdesigns', to: 'home#adcomdesigns'

  get 'new_homepage', to: 'home#new_homepage'

  resources :articles, only: [:index, :show]

  namespace :admin do
    root to: "articles#index"

    resources :articles
    resources :clients
    resources :testimonials
    resources :courses
    resources :courses_pdfs
  end

  root 'home#new_homepage'

  match '/' => 'home#create', :as => 'message', :via => :post

end
