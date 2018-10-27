class ReposicoesController < ApplicationController
  before_action :set_reposicao, only: [:show, :edit, :update, :destroy]

  # GET /reposicoes
  # GET /reposicoes.json
  def index
    @reposicoes = Reposicao.all
  end

  # GET /reposicoes/1
  # GET /reposicoes/1.json
  def show
  end

  # GET /reposicoes/new
  def new
    @reposicao = Reposicao.new
  end

  # GET /reposicoes/1/edit
  def edit
    @produto = Produto.find(@reposicao.produto)
    @produto.update(quantidade_atual: (@produto.quantidade_atual -= @reposicao.quantidade))
  end

  # POST /reposicoes
  # POST /reposicoes.json
  def create
    @reposicao = Reposicao.new(reposicao_params)
    @reposicao.user = current_user
    @reposicao.data_reposicao = DateTime.now

    @produto = Produto.find(@reposicao.produto)
    @produto.update(
      quantidade_atual: (@produto.quantidade_atual += @reposicao.quantidade),
      ultima_entrada: Date.today
    )

    respond_to do |format|
      if @reposicao.save
        format.html { redirect_to @reposicao, notice: 'Reposicao was successfully created.' }
        format.json { render :show, status: :created, location: @reposicao }
      else
        format.html { render :new }
        format.json { render json: @reposicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reposicoes/1
  # PATCH/PUT /reposicoes/1.json
  def update
    @produto = Produto.find(@reposicao.produto)
    @produto.update(quantidade_atual: (@produto.quantidade_atual += @reposicao.quantidade))

    respond_to do |format|
      if @reposicao.update(reposicao_params)
        format.html { redirect_to @reposicao, notice: 'Reposicao was successfully updated.' }
        format.json { render :show, status: :ok, location: @reposicao }
      else
        format.html { render :edit }
        format.json { render json: @reposicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reposicoes/1
  # DELETE /reposicoes/1.json
  def destroy
    @reposicao.destroy
    respond_to do |format|
      format.html { redirect_to reposicoes_url, notice: 'Reposicao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reposicao
      @reposicao = Reposicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reposicao_params
      params.require(:reposicao).permit(:produto_id, :quantidade, :data_reposicao, :user_id)
    end
end
