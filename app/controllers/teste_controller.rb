require 'net/http'

class TesteController < ActionController::Base
	def index
		@produtos = Produto.all
	end

	def test
		@id = Produto.all.order(id: :desc).limit(1)[0]
		if(@id.nil?)
			@id = Produto.new
			@id.id = 0
		end

		@produto = Produto.new
		@produto.id = @id.id + 1
		@produto.nome = params[:quantidade]
		@produto.tipo = false

		if @produto.save
			@url = URI('http://192.168.1.5')
			@params = { status: 200 }

			@url.query = URI.encode_www_form(@params)

			Net::HTTP.get(@url)
		end
	end
end
