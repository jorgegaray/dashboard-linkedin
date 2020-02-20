Rails.application.routes.draw do
  get 'welcome/index' 
  root 'welcome#index'

  resources :people
  
  resources :companies, only: [:new, :create, :edit, :update, :index] do
    collection do
      get :find_companies
      post :find_linkedin_oauth
      get :find_linkedin
    end
  end
end
