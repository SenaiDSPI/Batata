class CreateListasProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :listas_produtos do |t|
      t.belongs_to :solicitacao, foreign_key: true
      t.belongs_to :produto, foreign_key: true
      t.integer :quantidade
      t.datetime :data_devolucao
      t.string :status
      t.string :observacao
      t.datetime :ultima_aprovacao
      t.datetime :ultima_retirada
      t.datetime :ultima_devolucao
      t.datetime :ultima_saida

      t.timestamps
    end
  end
end
