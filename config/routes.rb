Rails.application.routes.draw do
	root 'sessions#new'

    get '/signin' => 'sessions#new'
    
    resources :sessions, only: [:new, :create, :destroy]
    delete 'logout' => 'sessions#destroy'

	resources :users, only: [:new, :show, :create]

	resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
	post 'attractions/:id/go_on_ride' => 'attractions#go_on_ride'
end