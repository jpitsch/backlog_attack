Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[index show update destroy]
    resources :games, only: %w[index show create]
  end

  devise_for :users,
    defaults: { format: :json }, 
    path: '', 
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'api/sessions',
      registrations: 'api/registrations'
    }
end
