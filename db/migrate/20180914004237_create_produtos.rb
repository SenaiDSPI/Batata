class CreateProdutos < ActiveRecord::Migration[5.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.boolean :tipo,              default: false
      t.float :peso,                default: 0.0
      t.integer :linha
      t.integer :coluna
      t.date :validade
      t.integer :quantidade_minima
      t.integer :quantidade_maxima
      t.integer :quantidade_atual,  default: 0
      t.string :codigo_barra
      t.datetime :data_entrada

      t.timestamps
    end
  end
end
