class relatoriosController < ApplicationController
	def produto
		@produtos = Produto.all
	end
end