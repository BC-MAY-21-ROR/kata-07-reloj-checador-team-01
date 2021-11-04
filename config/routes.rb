Rails.application.routes.draw do
  resources :employees
  resources :attendances, :only => [:check_in, :check_out]
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
  get '/dashboard', to:'dashboard#admin'
  #allow make a post request from axios and register user check in
  post '/check-in', to: 'attendances#check_in'
  #allow make a post request from axios and register user check out
  post '/check-out',to: 'attendances#check_out'
  #allow get the view  of the average time of check in and check out in a month for employees
  get '/attendances-avg-time',to: 'employees#avg_time'

  get '/attendances-today', to: 'attendances#today'

end
