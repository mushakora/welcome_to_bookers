Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#top'
  get 'home/about' => 'users#about'
  resources :books, except: [:new]


  resources :users, except: [:new, :destroy]
end

