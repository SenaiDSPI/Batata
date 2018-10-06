require 'test_helper'

class ListasProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lista_produtos = listas_produtos(:one)
  end

  test "should get index" do
    get listas_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_lista_produtos_url
    assert_response :success
  end

  test "should create lista_produtos" do
    assert_difference('ListaProdutos.count') do
      post listas_produtos_url, params: { lista_produtos: { data_devolucao: @lista_produtos.data_devolucao, observacao: @lista_produtos.observacao, produto_id: @lista_produtos.produto_id, quantidade: @lista_produtos.quantidade, solicitacao_id: @lista_produtos.solicitacao_id, status: @lista_produtos.status } }
    end

    assert_redirected_to lista_produtos_url(ListaProdutos.last)
  end

  test "should show lista_produtos" do
    get lista_produtos_url(@lista_produtos)
    assert_response :success
  end

  test "should get edit" do
    get edit_lista_produtos_url(@lista_produtos)
    assert_response :success
  end

  test "should update lista_produtos" do
    patch lista_produtos_url(@lista_produtos), params: { lista_produtos: { data_devolucao: @lista_produtos.data_devolucao, observacao: @lista_produtos.observacao, produto_id: @lista_produtos.produto_id, quantidade: @lista_produtos.quantidade, solicitacao_id: @lista_produtos.solicitacao_id, status: @lista_produtos.status } }
    assert_redirected_to lista_produtos_url(@lista_produtos)
  end

  test "should destroy lista_produtos" do
    assert_difference('ListaProdutos.count', -1) do
      delete lista_produtos_url(@lista_produtos)
    end

    assert_redirected_to listas_produtos_url
  end
end
