Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'registrations'
     }
  root to: 'pages#home'
  get '/profile', to: 'users#profile'
  resources :assessments
  get '/result', to: 'assessments#display'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


