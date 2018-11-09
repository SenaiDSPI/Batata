class PortasController < ApplicationController
	def index
		# Definição de variaveis
		@solicitacoes = Solicitacao.all
		@lista_solicitacoes = []

		# For each
		@solicitacoes.each do |s|
			# Busca se há um produto na lista (de cada solicitação) que esteja com status aprovado 
			@listas_produtos = ListaProdutos.where(solicitacao_id: s, status: "liberado").or(ListaProdutos.where(solicitacao_id: s, status: "saida"))

			# Verifica se há um produto na lista (de cada solicitação) que esteja com status aprovado
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
		@lista_produtos = ListaProdutos.find(params[:id_produto]) # lista_produtos.id
		@lista_produtos.update(status: params[:status])

		# Busca por produtos com status de saida de solicitações diferentes
		@outros = ListaProdutos.where(status: params[:status])
		@outros.each do |produto|
			if @lista_produtos.solicitacao_id != produto.solicitacao_id
				produto.update(status: "liberado")
			end
		end

		# Atualiza a quantidade de produtos em estoque
		@produto = Produto.find(@lista_produtos.produto)
		@produto.update(ultima_retirada: Date.today)

		# Redireciona ao index
		respond_to do |format|
			format.html { redirect_to porta_index_path, notice: @produto.nome+" "+params[:status]+" com sucesso" }
		end
	end
end