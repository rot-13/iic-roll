IicRoll::Application.routes.draw do

  root :to => 'application#root'

  resources :participants, only: [:new, :create] do
    get :roll
  end

end
