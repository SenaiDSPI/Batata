json.extract! notificacao, :id, :titulo, :mensagem, :cod, :tipo, :created_at, :updated_at
json.url notificacao_url(notificacao, format: :json)
