class NotificacoesController < ApplicationController
  before_action :set_notificacao, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, only: [:new, :create, :destroy]
  before_action :is_superadmin, only: [:edit, :update]

  # GET /notificacoes
  # GET /notificacoes.json
  def index
    if current_user.admin
      @notificacoes = Notificacao.all
    else
      @notificacoes_all = Notificacao.all
      @notificacoes
      @notificacoes_all.each do |n|
        case n.cod
        when 0
          @notificacoes.push(n)
        when 1
          if current_user.nivel_acesso == "Admin" || current_user.nivel_acesso == "Almoxarife"
            @notificacoes.push(n)
          end
        when 2
          if current_user.nivel_acesso == "Admin" || current_user.nivel_acesso == "Requerente"
            @notificacoes.push(n)
          end
        when 3
          if current_user.nivel_acesso == "Almoxarife" || current_user.nivel_acesso == "Requerente"
            @notificacoes.push(n)
          end
        when 4
          if current_user.nivel_acesso == "Admin"
            @notificacoes.push(n)
          end
        when 5
          if current_user.nivel_acesso == "Almoxarife"
            @notificacoes.push(n)
          end
        when 6
          if current_user.nivel_acesso == "Requerente"
            @notificacoes.push(n)
          end
        end
      end
    end
  end

  # GET /notificacoes/1
  # GET /notificacoes/1.json
  def show
  end

  # GET /notificacoes/new
  def new
    @notificacao = Notificacao.new
  end

  # GET /notificacoes/1/edit
  def edit
  end

  # POST /notificacoes
  # POST /notificacoes.json
  def create
    @notificacao = Notificacao.new(notificacao_params)

    respond_to do |format|
      if @notificacao.save
        format.html { redirect_to @notificacao, notice: 'Notificacao was successfully created.' }
        format.json { render :show, status: :created, location: @notificacao }
      else
        format.html { render :new }
        format.json { render json: @notificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notificacoes/1
  # PATCH/PUT /notificacoes/1.json
  def update
    respond_to do |format|
      if @notificacao.update(notificacao_params)
        format.html { redirect_to @notificacao, notice: 'Notificacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @notificacao }
      else
        format.html { render :edit }
        format.json { render json: @notificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notificacoes/1
  # DELETE /notificacoes/1.json
  def destroy
    @notificacao.destroy
    respond_to do |format|
      format.html { redirect_to notificacoes_url, notice: 'Notificacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacao
      @notificacao = Notificacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacao_params
      params.require(:notificacao).permit(:titulo, :mensagem, :cod, :tipo)
    end
end
