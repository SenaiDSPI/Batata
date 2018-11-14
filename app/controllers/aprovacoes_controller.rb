class AprovacoesController < ApplicationController
	before_action :is_almoxarife

	def index
		# Definição de variaveis
		@solicitacoes = Solicitacao.all
		@lista_solicitacoes = []

		# For each
		@solicitacoes.each do |s|
			# Busca se há um produto na lista (de cada solicitação) que esteja com status aberto 
			@listas_produtos = ListaProdutos.where(solicitacao_id: s, status: "aberto")

			# Verifica se há um produto na lista (de cada solicitação) que esteja com status aberto
			if !@listas_produtos[0].nil?
				@lista_solicitacoes.push(s)
			end
		end

		# Após a filtragem devolve as solicitações necessarias para o index
		@solicitacoes = @lista_solicitacoes
	end

	def info
		@solicitacao = Solicitacao.find(params[:id])
    @listas_produtos = ListaProdutos.where(solicitacao_id: params[:id])
	end

	def update
		# Atualiza o status do produto na lista de produtos
		@produto = ListaProdutos.find(params[:id_produto])
		@produto.update(status: params[:status])

		# Redirecionado ao index
		respond_to do |format|
			format.html { redirect_to aprovacao_index_path, notice: @produto.produto.nome+" "+params[:status]+" com sucesso" }
		end
	end
end