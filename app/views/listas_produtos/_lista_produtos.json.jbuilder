json.extract! lista_produtos, :id, :solicitacao_id, :produto_id, :quantidade, :data_devolucao, :status, :observacao, :created_at, :updated_at
json.url lista_produtos_url(lista_produtos, format: :json)
