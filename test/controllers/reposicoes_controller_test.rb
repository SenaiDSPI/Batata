require 'test_helper'

class ReposicoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reposicao = reposicoes(:one)
  end

  test "should get index" do
    get reposicoes_url
    assert_response :success
  end

  test "should get new" do
    get new_reposicao_url
    assert_response :success
  end

  test "should create reposicao" do
    assert_difference('Reposicao.count') do
      post reposicoes_url, params: { reposicao: { data_reposicao: @reposicao.data_reposicao, produto_id: @reposicao.produto_id, quantidade: @reposicao.quantidade, user_id: @reposicao.user_id } }
    end

    assert_redirected_to reposicao_url(Reposicao.last)
  end

  test "should show reposicao" do
    get reposicao_url(@reposicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_reposicao_url(@reposicao)
    assert_response :success
  end

  test "should update reposicao" do
    patch reposicao_url(@reposicao), params: { reposicao: { data_reposicao: @reposicao.data_reposicao, produto_id: @reposicao.produto_id, quantidade: @reposicao.quantidade, user_id: @reposicao.user_id } }
    assert_redirected_to reposicao_url(@reposicao)
  end

  test "should destroy reposicao" do
    assert_difference('Reposicao.count', -1) do
      delete reposicao_url(@reposicao)
    end

    assert_redirected_to reposicoes_url
  end
end
