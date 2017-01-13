Rails.application.routes.draw do
  root "galleries#index"

  resources :galleries do
    resources :paintings, only: [:index, :show, :create, :new]
  end
end
