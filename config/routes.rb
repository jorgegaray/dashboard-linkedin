Rails.application.routes.draw do
  get 'welcome/index' 
  root 'welcome#index'

  resources :people do    
  end
  
  resources :companies do
  end
end
