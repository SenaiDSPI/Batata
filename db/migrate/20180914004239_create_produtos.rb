class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :tipo
      t.float :peso
      t.integer :linha
      t.integer :coluna
      t.date :validade
      t.integer :quantidade_minima
      t.integer :quantidade_maxima
      t.integer :quantidade_atual
      t.string :codigo_barra
      t.date :data_entrada
      t.date :ultima_entrada
      t.date :ultima_retirada
      t.date :ultima_devolucao

      t.timestamps
    end
  end
end
