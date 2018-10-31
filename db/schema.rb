# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181008215414) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "listas_produtos", force: :cascade do |t|
    t.integer  "solicitacao_id"
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "data_devolucao"
    t.string   "status"
    t.string   "observacao"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["produto_id"], name: "index_listas_produtos_on_produto_id", using: :btree
    t.index ["solicitacao_id"], name: "index_listas_produtos_on_solicitacao_id", using: :btree
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.string   "tipo"
    t.float    "peso"
    t.integer  "linha"
    t.integer  "coluna"
    t.date     "validade"
    t.integer  "quantidade_minima"
    t.integer  "quantidade_maxima"
    t.integer  "quantidade_atual"
    t.string   "codigo_barra"
    t.date     "data_entrada"
    t.date     "ultima_entrada"
    t.date     "ultima_retirada"
    t.date     "ultima_devolucao"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "reposicoes", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "quantidade"
    t.datetime "data_reposicao"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["produto_id"], name: "index_reposicoes_on_produto_id", using: :btree
    t.index ["user_id"], name: "index_reposicoes_on_user_id", using: :btree
  end

  create_table "solicitacoes", force: :cascade do |t|
    t.string   "titulo"
    t.integer  "user_id"
    t.datetime "data_solicitacao"
    t.string   "status"
    t.string   "observacao"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_solicitacoes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "nome"
    t.string   "cargo"
    t.string   "nivel_acesso"
    t.string   "login"
    t.string   "telefone"
    t.string   "tag"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "listas_produtos", "produtos"
  add_foreign_key "listas_produtos", "solicitacoes"
  add_foreign_key "reposicoes", "produtos"
  add_foreign_key "reposicoes", "users"
  add_foreign_key "solicitacoes", "users"
end
