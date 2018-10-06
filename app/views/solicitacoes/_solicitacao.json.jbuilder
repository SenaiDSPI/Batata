json.extract! solicitacao, :id, :titulo, :user_id, :data_solicitacao, :status, :observacao, :created_at, :updated_at
json.url solicitacao_url(solicitacao, format: :json)
