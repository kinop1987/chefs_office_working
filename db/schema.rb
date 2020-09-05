# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_05_013724) do

  create_table "contract_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "unit_price"
    t.integer "quantity", null: false
    t.string "product_name", null: false
    t.integer "total_price"
    t.bigint "contract_id", null: false
    t.bigint "order_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "delivery_date", null: false
    t.string "product_unit", null: false
    t.index ["contract_id"], name: "index_contract_details_on_contract_id"
    t.index ["order_id"], name: "index_contract_details_on_order_id"
    t.index ["supplier_id"], name: "index_contract_details_on_supplier_id"
  end

  create_table "contracts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "supplier_id", null: false
    t.integer "total_price", null: false
    t.date "delivery_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "comment"
    t.index ["order_id"], name: "index_contracts_on_order_id"
    t.index ["supplier_id"], name: "index_contracts_on_supplier_id"
  end

  create_table "memos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id", null: false
    t.index ["order_id"], name: "index_memos_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "telephone", null: false
    t.index ["email"], name: "index_orders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_orders_on_reset_password_token", unique: true
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "product_name", null: false
    t.integer "product_price"
    t.string "product_unit", null: false
    t.bigint "supplier_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "availability", default: false, null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "suppliers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "telephone", null: false
    t.string "pic", null: false
    t.string "website", null: false
    t.index ["email"], name: "index_suppliers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_suppliers_on_reset_password_token", unique: true
  end

  create_table "voucher_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "product_name", null: false
    t.integer "unit_price", null: false
    t.string "product_unit", null: false
    t.integer "total_price", null: false
    t.date "delivery_date", null: false
    t.bigint "order_id", null: false
    t.bigint "supplier_id", null: false
    t.bigint "voucher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity", null: false
    t.index ["order_id"], name: "index_voucher_details_on_order_id"
    t.index ["supplier_id"], name: "index_voucher_details_on_supplier_id"
    t.index ["voucher_id"], name: "index_voucher_details_on_voucher_id"
  end

  create_table "vouchers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "total_price", null: false
    t.date "delivery_date", null: false
    t.bigint "order_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "comment"
    t.integer "confirm", default: 0, null: false
    t.index ["order_id"], name: "index_vouchers_on_order_id"
    t.index ["supplier_id"], name: "index_vouchers_on_supplier_id"
  end

  add_foreign_key "contract_details", "contracts"
  add_foreign_key "contract_details", "orders"
  add_foreign_key "contract_details", "suppliers"
  add_foreign_key "contracts", "orders"
  add_foreign_key "contracts", "suppliers"
  add_foreign_key "memos", "orders"
  add_foreign_key "products", "suppliers"
  add_foreign_key "voucher_details", "orders"
  add_foreign_key "voucher_details", "suppliers"
  add_foreign_key "voucher_details", "vouchers"
  add_foreign_key "vouchers", "orders"
  add_foreign_key "vouchers", "suppliers"
end
