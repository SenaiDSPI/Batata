class CreateNotificacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :notificacoes do |t|
      t.string :titulo
      t.text :mensagem
      t.integer :cod
      t.string :tipo

      t.timestamps
    end
  end
end
