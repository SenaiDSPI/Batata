class TesteController < ActionController::Base
	def index
		@reposicoes = Reposicao.all
	end

	def test
		@id = Reposicao.all.order(id: :desc)[0]

		@reposicao = Reposicao.new
		@reposicao.id = @id.id + 1
		@reposicao.produto = Produto.find(1)
		@reposicao.user = User.find(1)
		@reposicao.quantidade = params[:quantidade]
		


		respond_to do |format|
			format.html { redirect_to teste_path, notice: "final: "+ @reposicao.save.to_s }
		end
	end
end