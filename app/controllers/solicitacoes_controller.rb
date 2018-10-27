class SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]

  # GET /solicitacoes
  # GET /solicitacoes.json
  def index
    @solicitacoes = Solicitacao.all
  end

  # GET /solicitacoes/1
  # GET /solicitacoes/1.json
  def show
    @solicitacao.user = User.find(@solicitacao.user)
    @listas_produtos = ListaProdutos.where(solicitacao_id: @solicitacao.id)
  end

  # GET /solicitacoes/new
  def new
    @solicitacao = Solicitacao.new
  end

  # GET /solicitacoes/1/edit
  def edit
  end

  # POST /solicitacoes
  # POST /solicitacoes.json
  def create
    @solicitacao = Solicitacao.new(solicitacao_params)
    @solicitacao.user = current_user
    @solicitacao.data_solicitacao = DateTime.now

    respond_to do |format|
      if @solicitacao.save
        format.html { redirect_to listas_produtos_path(solicitacao_id: @solicitacao.id), notice: 'Solicitação feita com sucesso.' }
        format.json { render :show, status: :created, location: @solicitacao }
      else
        format.html { render :new }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicitacoes/1
  # PATCH/PUT /solicitacoes/1.json
  def update
    respond_to do |format|
      if @solicitacao.update(solicitacao_params)
        format.html { redirect_to listas_produtos_path(solicitacao_id: @solicitacao.id), notice: 'Solicitacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @solicitacao }
      else
        format.html { render :edit }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitacoes/1
  # DELETE /solicitacoes/1.json
  def destroy
    @solicitacao.destroy
    respond_to do |format|
      format.html { redirect_to solicitacoes_url, notice: 'Solicitacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitacao
      @solicitacao = Solicitacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solicitacao_params
      params.require(:solicitacao).permit(:titulo, :user_id, :data_solicitacao, :status, :observacao)
    end
end
