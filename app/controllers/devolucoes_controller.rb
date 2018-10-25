class DevolucoesController < ApplicationController
	def index
		# Definição de variaveis
		@solicitacoes = Solicitacao.where(status: "aberto").or(Solicitacao.where(status: "fechado"))
		@lista_solicitacoes = []

		# For each
		@solicitacoes.each do |s|
			# Verifica as solicitações com status em aberto
			if s.status == "aberto"
				# Busca se há um produto na lista (de cada solicitação) que esteja retirado 
				@lista_produtos = ListaProdutos.where(solicitacao_id: s, status: "retirado").limit(1)

				# Verifica se há um produto na lista (de cada solicitação) que esteja aprovado
				if !@lista_produtos[0].nil?
					@lista_solicitacoes.push(s);
				end

			# Verifica as solicitações com status em fechado 
			elsif s.status == "fechado"
				# Busca se há um produto na lista (de cada solicitação) que esteja retirado 
				@lista_produtos = ListaProdutos.where(solicitacao_id: s, status: "retirado").limit(1)

				# Verifica se há um produto na lista (de cada solicitação) que esteja aprovado
				if !@lista_produtos[0].nil?
					@lista_solicitacoes.push(s);
				end
			end
		end

		# Após a filtragem devolve as solicitações necessarias para o index
		if !@lista_solicitacoes.nil?
			@solicitacoes = @lista_solicitacoes
		end
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
		@listas_produtos = ListaProdutos.where(solicitacao_id: @produto.solicitacao, status: "retirado")
		
		# verifica se a lista tem produtos em aberto, se não, modifica o status da solicitação para fechado 
		if @listas_produtos[0].nil?
			@solicitacao = Solicitacao.find(@produto.solicitacao)
			@solicitacao.update(status: "fechado")
		end

		# Redireciona ao index
		respond_to do |format|
			format.html { redirect_to devolucao_index_path }
		end
	end
end