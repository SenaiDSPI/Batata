class ComunicacaoController < ActionController::Base
	def index
		@rfids = Rfid.all
		@notificacoes = Notificacao.all
		@resposta = params[:format]
	end

	def rfid
		@rfid = Rfid.where(id: 0)[0]

		# operador '||=' se o objeto for nulo ele realiza a açao a seguir
		@rfid ||= Rfid.new
		@rfid.id = 0


		@rfid.cod = params[:cod]

		@resposta = "Rfid atualizado: "+ @rfid.update(cod: @rfid.cod).to_s

		redirect_to comunicacao_path
	end

	def variacao
		if params[:cod].to_i == 2 # Balança
			@produto = Produto.where(linha: params[:linha], coluna: params[:coluna])[0]

			# Resolver multiplos
			@listas_produtos = ListaProdutos.where(status: "saida")

			# Fim multiplos
			unless @produto.nil?
				unless @listas_produtos[0].nil?
					@peso_total = params[:valor].to_f / 10 # Conversão para float
					# Arruma peso atual e já era
					@peso_atual = 0
					@listas_produtos.each do |tmp|
						@peso_atual += @produto.peso * tmp.quantidade
					end

					if @peso_total != @peso_atual
						@notificacao = Notificacao.new
						@notificacao.titulo = "Variação na Balança"
						@notificacao.mensagem = "Houve uma variação na balança de " + @peso_total.to_s + "Kg, para " + @peso_atual.to_s + "Kg.\nLinha: " + @produto.linha.to_s + ".\nColuna: " + @produto.coluna.to_s
						@notificacao.cod = 1
						@notificacao.tipo = "alerta"
						@notificacao.save

						@resposta = "Notificação criada!"
					end
					if @resposta.nil?
						@resposta = "Peso identico! (Nada muda)"
					end
				
				else
					@resposta = "Pedidos não existentes! (Nada muda)"
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

				@resposta = "Notificação criada!"
			end
		else
			@resposta = "Código inválido."
		end
		
		if @resposta.nil?
			@resposta = "Produto não encontrado."
		end
		redirect_to comunicacao_path(@resposta)
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

					@resposta = "Notificação criada!"
				end
			else
				@resposta = "Código inválido."
			end
		end

		if notice.nil?
			@resposta = "Produto não encontrado."
		end
		redirect_to comunicacao_path
	end

	def porta
		@user = User.where(tag: params[:rfid])[0]
		unless @user.nil?
			@solicitacoes = Solicitacao.where(user_id: @user)
			unless @user.nil?
				@resposta = true
			end
			
			# @pedidos = []
			# @solicitacoes.each do |s|
			# 	@tmp = ListaProdutos.where(status: "saida", solicitacao: s)[0]
			# 	unless @tmp.nil?
			# 		@pedidos.push(@tmp)
			# 	end
			# end

			# unless @pedidos[0].nil?
			# 	@peso_atual = params[:peso].to_f / 10

			# 	@peso_total = 0
			# 	@pedidos.each do |pedido|
			# 		@peso_total += pedido.produto.peso * pedido.quantidade
			# 	end

			# 	if @peso_total == @peso_atual
			# 		@resposta = true
			# 		@pedidos.each do |pedido|
			# 			pedido.update(status: "retirado")
			# 		end
			# 	end
			# end
		end

		# if @resposta.nil?
		# 	@resposta = false
		# end

		@url = URI('http://192.168.1.5')
		@params = { status: 200 }
		
		unless @resposta
			@params = { status: 201 }
		end
		
		@url.query = URI.encode_www_form(@params)
		Net::HTTP.get(@url)
	end
end