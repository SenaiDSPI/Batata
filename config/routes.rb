Rails.application.routes.draw do
  resources :listas_produtos
  resources :solicitacoes
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :produtos
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
