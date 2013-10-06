IicRoll::Application.routes.draw do

  root :to => 'application#root'

  resources :persons, only: [:new, :create] do
    get :roll
  end

end
