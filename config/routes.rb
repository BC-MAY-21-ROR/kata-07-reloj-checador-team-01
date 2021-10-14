Rails.application.routes.draw do
  resources :employees
  resources :companies
  #For skipping the logic registration to users
  devise_for :users, :skip => [:registrations] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #allow edit and update information fo users
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  root 'static#index'
  namespace :v1, defaults: {format: 'json' } do
    get 'things', to: 'things#index'
  end
end
