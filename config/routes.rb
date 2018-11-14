Rails.application.routes.draw do
  # Rails Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Devise Auth
  devise_for :users
  resources :users

  # Scaffolds
  resources :produtos
  resources :notificacoes
  resources :reposicoes
  resources :listas_produtos
  resources :solicitacoes

  # Root path
  root to: 'pages#home'

  # Console path
  get 'console', to: 'console#index', as: 'console'

  # Teste
  get 'teste', to: 'teste#index', as: 'teste'
  get 'teste/:quantidade', to: 'teste#test', as: 'test'

  # Comunicacao
  get 'comunicacao', to: 'comunicacao#index', as: 'comunicacao'
  get 'comunicacao/rfid/:cod', to: 'comunicacao#rfid', as: 'comunicacao_rfid'
  get 'comunicacao/variacao/:cod/:linha/:coluna/:valor', to: 'comunicacao#variacao', as: 'comunicacao_variacao'
  get 'comunicacao/erro/:cod/:tipo/:linha/:coluna', to: 'comunicacao#erro', as: 'comunicacao_erro'
  get 'comunicacao/porta/:rfid/:peso', to: 'comunicacao#porta', as: 'comunicacao_porta'

  # Aprovações
  get 'aprovacoes', to: 'aprovacoes#index', as: 'aprovacao_index'
  get 'aprovacoes/:id', to: 'aprovacoes#info', as: 'aprovacao_info'
  get 'aprovacoes/:id/update/:id_produto/:status', to: 'aprovacoes#update', as: 'aprovacao_update'

  # Porta (saida)
  get 'saida', to: 'portas#index', as: 'porta_index'
  get 'saida/:id', to: 'portas#info', as: 'porta_info'
  get 'saida/:id/update/:id_produto/:status', to: 'portas#update', as: 'porta_update'

  # Retirada
  get 'retiradas', to: 'retiradas#index', as: 'retirada_index'
  get 'retiradas/:id', to: 'retiradas#info', as: 'retirada_info'
  get 'retiradas/:id/update/:id_produto/:status', to: 'retiradas#update', as: 'retirada_update'

  # Devolução
  get 'devolucoes', to: 'devolucoes#index', as: 'devolucao_index'
  get 'devolucoes/:id', to: 'devolucoes#info', as: 'devolucao_info'
  get 'devolucoes/:id/update/:id_produto/:status', to: 'devolucoes#update', as: 'devolucao_update'
end
