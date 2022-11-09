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
    resources :lenses, only: [:create]
  end

  namespace :users do
    resources :frames, only: [:index]
    resources :lenses, only: [:index]
    resources :items, except: [:destroy, :show] do
      get 'place_order', on: :collection
    end
  end
end
