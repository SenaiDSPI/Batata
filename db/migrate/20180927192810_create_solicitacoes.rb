class CreateSolicitacoes < ActiveRecord::Migration[5.0]
  def change
    create_table :solicitacoes do |t|
      t.string :titulo
      t.belongs_to :user, foreign_key: true
      t.datetime :data_solicitacao
      t.string :status
      t.string :observacao

      t.timestamps
    end
  end
end
