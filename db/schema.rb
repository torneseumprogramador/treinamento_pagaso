# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_23_180248) do
  create_table "administradors", force: :cascade do |t|
    t.string "nome", limit: 150
    t.string "senha", limit: 100
    t.string "email", limit: 150
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.text "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.string "cnpj"
    t.boolean "ativo", default: true
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.float "valor_total"
    t.text "itens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "tbl_produtos", force: :cascade do |t|
    t.text "nome", limit: 200, null: false
    t.integer "id_do_pedido"
  end

  add_foreign_key "pedidos", "clientes"
end