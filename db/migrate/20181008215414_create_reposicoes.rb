class CreateReposicoes < ActiveRecord::Migration[5.0]
  def change
    create_table :reposicoes do |t|
      t.belongs_to :produto, foreign_key: true
      t.integer :quantidade
      t.datetime :data_reposicao
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
