class ListaProdutos < ApplicationRecord
  belongs_to :solicitacao
  belongs_to :produto
end
