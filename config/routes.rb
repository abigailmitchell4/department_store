Rails.application.routes.draw do
  root "departments#index"
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :departments do
    resources :items 
  end

end
