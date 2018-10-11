class Reposicao < ApplicationRecord
	belongs_to :produto
	belongs_to :user

  def updateProduto
  	@quantidade = 5
  	@produto = Produto.find(@reposicao.produto)
    @produto.update(quantidade_atual: (@produto.quantidade_atual + @quantidade))
  end
end