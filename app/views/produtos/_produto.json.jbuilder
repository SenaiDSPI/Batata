json.extract! produto, :id, :nome, :tipo, :peso, :linha, :coluna, :validade, :quantidade_minima, :quantidade_maxima, :quantidade_atual, :codigo_barra, :data_entrada, :ultima_entrada, :ultima_retirada, :ultima_devolucao, :created_at, :updated_at
json.url produto_url(produto, format: :json)
