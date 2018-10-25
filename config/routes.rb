Rails.application.routes.draw do
  resources :reposicoes
  resources :reposicaos
  resources :listas_produtos
  resources :solicitacoes
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :produtos
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'console', to: 'console#index', as: 'console'
  
  # Aprovações
  get 'aprovacoes', to: 'aprovacoes#index', as: 'aprovacao_index'
  get 'aprovacoes/:id', to: 'aprovacoes#info', as: 'aprovacao_info'
  get 'aprovacoes/:id/update/:id_produto/:status', to: 'aprovacoes#update', as: 'aprovacao_update'

  # Retirada
  get 'retiradas', to: 'retiradas#index', as: 'retirada_index'
  get 'retiradas/:id', to: 'retiradas#info', as: 'retirada_info'
  get 'retiradas/:id/update/:id_produto/:status', to: 'retiradas#update', as: 'retirada_update'

  # Devolução
  get 'devolucoes', to: 'devolucoes#index', as: 'devolucao_index'
  get 'devolucoes/:id', to: 'devolucoes#info', as: 'devolucao_info'
  get 'devolucoes/:id/update/:id_produto/:status', to: 'devolucoes#update', as: 'devolucao_update'
  
  # get 'retirada', to: 'movimentacoes#retirada'
  # get 'devolucao', to: 'movimentacoes#devolucao'
end
