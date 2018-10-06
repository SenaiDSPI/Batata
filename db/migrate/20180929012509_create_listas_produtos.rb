class CreateListasProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :listas_produtos do |t|
      t.belongs_to :solicitacao, foreign_key: true
      t.belongs_to :produto, foreign_key: true
      t.integer :quantidade
      t.datetime :data_devolucao
      t.string :status
      t.string :observacao

      t.timestamps
    end
  end
end
