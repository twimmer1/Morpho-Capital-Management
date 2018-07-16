Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :holdings do
  	resources :leases
  end

  resources :leases

  root 'welcome#index'
 
end
