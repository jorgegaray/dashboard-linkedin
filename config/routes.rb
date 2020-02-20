Rails.application.routes.draw do
  get 'welcome/index' 
  root 'welcome#index'

  resources :people
  
  resources :companies, only: [:new, :create, :edit, :update, :index] do
    collection do
      get :find_companies
      get :linkedin_token
      post :linkedin_token
    end
  end
end
