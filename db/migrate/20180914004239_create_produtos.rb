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
      t.date :data_entrada
      t.date :ultima_entrada
      t.date :ultima_retirada
      t.date :ultima_devolucao

      t.timestamps
    end
  end
end
