class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.boolean :tipo,              null: false
      t.float :peso,                null: 0.0
      t.integer :linha,             null: 0
      t.integer :coluna,            null: 0
      t.date :validade
      t.integer :quantidade_minima
      t.integer :quantidade_maxima
      t.integer :quantidade_atual,  null: 0
      t.string :codigo_barra
      t.datetime :data_entrada
      t.datetime :ultima_entrada
      t.datetime :ultima_retirada
      t.datetime :ultima_devolucao

      t.timestamps
    end
  end
end
