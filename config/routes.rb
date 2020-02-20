Rails.application.routes.draw do
  get 'welcome/index' 
  root 'welcome#index'

  resources :people
  
  resources :companies, only: [:new, :create, :edit, :update, :index] do
  end
end
