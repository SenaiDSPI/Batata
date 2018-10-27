class ListasProdutosController < ApplicationController
  before_action :set_lista_produtos, only: [:show, :edit, :update, :destroy]

  # GET /listas_produtos
  # GET /listas_produtos.json
  def index
    @listas_produtos = ListaProdutos.where(solicitacao_id: params[:solicitacao_id])
  end

  # GET /listas_produtos/1
  # GET /listas_produtos/1.json
  def show
  end

  # GET /listas_produtos/new
  def new
    @lista_produtos = ListaProdutos.new
    @lista_produtos.solicitacao_id = params[:solicitacao_id]
    
    @produtos = Produto.all
  end

  # GET /listas_produtos/1/edit
  def edit
    @lista_produtos.solicitacao_id = params[:solicitacao_id]
  end

  # POST /listas_produtos
  # POST /listas_produtos.json
  def create
    @lista_produtos = ListaProdutos.new(lista_produtos_params)
    @lista_produtos.status = "aberto"

    respond_to do |format|
      if @lista_produtos.save
        format.html { redirect_to listas_produtos_path(solicitacao_id: @lista_produtos.solicitacao_id), notice: 'Lista produtos was successfully created.' }
        format.json { render :show, status: :created, location: @lista_produtos }
      else
        format.html { render :new }
        format.json { render json: @lista_produtos.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listas_produtos/1
  # PATCH/PUT /listas_produtos/1.json
  def update
    respond_to do |format|
      if @lista_produtos.update(lista_produtos_params)
        format.html { redirect_to listas_produtos_path(solicitacao_id: @lista_produtos.solicitacao_id), notice: 'Lista produtos was successfully updated.' }
        format.json { render :show, status: :ok, location: @lista_produtos }
      else
        format.html { render :edit }
        format.json { render json: @lista_produtos.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listas_produtos/1
  # DELETE /listas_produtos/1.json
  def destroy
    @lista_produtos.destroy
    respond_to do |format|
      format.html { redirect_to listas_produtos_url(solicitacao_id: @lista_produtos.solicitacao_id), notice: 'Lista produtos was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lista_produtos
      @lista_produtos = ListaProdutos.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lista_produtos_params
      params.require(:lista_produtos).permit(:solicitacao_id, :produto_id, :quantidade, :data_devolucao, :status, :observacao)
    end
end
