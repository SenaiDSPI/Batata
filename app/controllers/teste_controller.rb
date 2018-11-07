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
		


		respond_to do |format|
			format.html { redirect_to teste_path, notice: "final: "+ @produto.save.to_s }
		end
	end
end