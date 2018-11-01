# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string  :nome
      t.string  :login
      t.string  :email,              null: false, default: ""
      t.string  :cargo
      t.string  :nivel_acesso
      t.string  :telefone
      t.string  :tag
      t.boolean :admin,                           default: false
      t.boolean :ativo,                           default: true
      t.string  :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      t.timestamps null: false
    end

    add_index :users, :login,                unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
