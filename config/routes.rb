Rails.application.routes.draw do
  resources :apartments

  root to: 'apartments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
