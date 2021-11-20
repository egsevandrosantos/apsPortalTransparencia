Rails.application.routes.draw do
  resources :users
  resources :limite_gastos, only: [:index], to: 'limite_gastos#index'
  get "generate_rel", to: 'limite_gastos#generate_rel'
  get "generate_rel_by_uf", to: 'limite_gastos#generate_rel_by_uf'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'limite_gastos#index'
end
