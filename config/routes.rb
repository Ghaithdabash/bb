Rails.application.routes.draw do
  devise_for :admins, defaults: { format: :json },
             controllers: {
                 sessions: 'admins/sessions',
             }
  devise_for :users, defaults: { format: :json },
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  namespace :admins do
    resources :frames, only: [:create]
  end
end
