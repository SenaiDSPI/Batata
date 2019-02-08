class RelatoriosController < ApplicationController
	def produtos
		@produtos = Produto.all
		@produtos_total = []
		@produtos.each do |produto|
			@reposicoes = Reposicao.where(produto_id: produto)
			@retiradas = ListaProdutos.where(produto_id: produto)

			@tmp_entrada = 0
			@tmp_saida = 0
			
			@reposicoes.each do |t|
				@tmp_entrada += t.quantidade
			end

			@retiradas.each do |t|
				@tmp_saida += t.quantidade
			end

			@produtos_total.push({entrada: @tmp_entrada, saida: @tmp_saida, produto: produto})
		end
	end
end
