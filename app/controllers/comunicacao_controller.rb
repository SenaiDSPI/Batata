class ComunicacaoController < ActionController::Base
	def index
		@rfids = Rfid.all
		@ts = Notificacao.all
	end

	def rfid
		@rfid = Rfid.where(id: 0)[0]

		# operador '||=' se o objeto for nulo ele realiza a açao a seguir
		@rfid ||= Rfid.new
		@rfid.id = 0


		@rfid.cod = params[:cod]

		respond_to do |format|
			format.html { redirect_to comunicacao_path, notice: "Rfid atualizado: "+ @rfid.update(cod: @rfid.cod).to_s }
		end
	end

	def variacao
		if params[:cod].to_i == 2 # Balança
			@produto = Produto.where(linha: params[:linha], coluna: params[:coluna])[0]
			
			unless @produto.nil?
				@peso_total = @produto.peso * @produto.quantidade_atual
				@peso_atual = params[:valor]

				@notificacao = Notificacao.new
				@notificacao.titulo = "Variação na Balança"
				@notificacao.mensagem = "Houve uma variação na balança de " + @peso_total.to_s + "Kg, para " + @peso_atual.to_s + "Kg.\nLinha: " + @produto.linha.to_s + ".\nColuna: " + @produto.coluna.to_s
				@notificacao.cod = 1
				@notificacao.tipo = "alerta"
				@notificacao.save

				respond_to do |format|
					format.html { redirect_to comunicacao_path, notice: "Notificação criada!" }
				end
			end
		elsif params[:cod].to_i == 3 # Ultrasson
			@produto = Produto.where(linha: params[:linha], coluna: params[:coluna])[0]
			
			unless @produto.nil?
				@notificacao = Notificacao.new
				@notificacao.titulo = "Ultrassom"
				@notificacao.mensagem = "O ultrassom alertou uma discrepância.\nLinha: " + @produto.linha.to_s + ".\nColuna: " + @produto.coluna.to_s
				@notificacao.cod = 1
				@notificacao.tipo = "alerta"
				@notificacao.save

				respond_to do |format|
					format.html { redirect_to comunicacao_path, notice: "Notificação criada!" }
				end
			end
		else
			respond_to do |format|
				format.html { redirect_to comunicacao_path, notice: "Código inválido."  }
			end
		end
		
		if notice.nil?
			respond_to do |format|
				format.html { redirect_to comunicacao_path, notice: "Produto não encontrado."  }
			end
		end
	end

	def erro
		if params[:cod].to_i == 1
			@produto = Produto.where(linha: params[:linha], coluna: params[:coluna])[0]
			
			unless @produto.nil?
				@tipo = params[:tipo]

				unless @tipo.nil?
					@notificacao = Notificacao.new
					@notificacao.titulo = "Falha no Hardware"
					@notificacao.mensagem = "Foi encontado um erro no(a) "+ @tipo +" contate o administrador para resolver o problema.\nLinha: " + @produto.linha.to_s + ".\nColuna: " + @produto.coluna.to_s
					@notificacao.cod = 1
					@notificacao.tipo = "erro"
					@notificacao.save

					respond_to do |format|
						format.html { redirect_to comunicacao_path, notice: "Notificação criada!" }
					end
				end
			else
				respond_to do |format|
				format.html { redirect_to comunicacao_path, notice: "Código inválido."  }
			end
			end
		end

		if notice.nil?
			respond_to do |format|
				format.html { redirect_to comunicacao_path, notice: "Produto não encontrado."  }
			end
		end
	end

	def porta
		@user = User.where(tag: params[:rfid])[0]
		unless @user.nil?
			@solicitacoes = Solicitacao.where(user_id: @user)
			@pedidos = []
			@solicitacoes.each do |s|
				@pedidos.push(ListaProdutos.where(status: "liberado", solicitacao: s))
			end
			unless @pedidos[0].nil?
				@pedidos.each do |pedido|
					pedido.peso_total = pedido.produto.peso * pedido.produto.quantidade_atual
					if peso_total == params[:peso]
						@resposta = true
					end
				end
			end
		end

		if @resposta.nil?
			@resposta = false
		end
	end
end