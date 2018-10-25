class AprovacoesController < ApplicationController
	def index
		@solicitacoes = Solicitacao.where(status: "aberto").order(id: :asc)
	end

	def info
		@solicitacao = Solicitacao.find(params[:id])
    @listas_produtos = ListaProdutos.where(solicitacao_id: params[:id])
	end

	def update
		# Atualiza o status do produto na lista de produtos
		@produto = ListaProdutos.find(params[:id_produto])
		@produto.update(status: params[:status])

		# Busca a lista completa de produtos da solicitação 
		@listas_produtos = ListaProdutos.where(solicitacao_id: @produto.solicitacao, status: "aberto")
		
		# verifica se a lista tem produtos em aberto, se não, modifica o status da solicitação para fechado 
		if @listas_produtos[0].nil?
			@solicitacao = Solicitacao.find(@produto.solicitacao)
			@solicitacao.update(status: "fechado")
		end

		# Redirecionado ao index
		respond_to do |format|
			format.html { redirect_to aprovacao_index_path }
		end
	end
end