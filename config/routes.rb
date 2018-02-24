Rails.application.routes.draw do

  root to: "cocktails#index"

  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [ :new, :create]
  end

  resources :doses, only: [ :show, :edit, :update, :destroy ]

  get '/cocktails/search/:query', :to => 'cocktails#search', :as => :search

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
