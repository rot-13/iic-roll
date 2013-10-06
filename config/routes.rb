IicRoll::Application.routes.draw do

  root :to => 'application#root'

  resources :participants, only: [:new, :create, :show]

  get 'roll', controller: 'participants'

end
