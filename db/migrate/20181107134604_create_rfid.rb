class CreateRfid < ActiveRecord::Migration[5.0]
  def change
    create_table :rfids do |t|
      t.string :cod

      t.timestamps
    end
  end
end
