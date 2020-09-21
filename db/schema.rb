ActiveRecord::Schema.define(version: 20_200_913_090_509) do
  create_table 'contract_details', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'unit_price'
    t.integer 'quantity', null: false
    t.string 'product_name', null: false
    t.integer 'total_price'
    t.bigint 'contract_id', null: false
    t.bigint 'order_id', null: false
    t.bigint 'supplier_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.date 'delivery_date', null: false
    t.string 'product_unit', null: false
    t.index ['contract_id'], name: 'index_contract_details_on_contract_id'
    t.index ['order_id'], name: 'index_contract_details_on_order_id'
    t.index ['supplier_id'], name: 'index_contract_details_on_supplier_id'
  end

  create_table 'contracts', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'order_id', null: false
    t.bigint 'supplier_id', null: false
    t.integer 'total_price', null: false
    t.date 'delivery_date', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'comment'
    t.integer 'confirm', null: false
    t.index ['order_id'], name: 'index_contracts_on_order_id'
    t.index ['supplier_id'], name: 'index_contracts_on_supplier_id'
  end

  create_table 'cookings', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'text', null: false
    t.bigint 'order_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['order_id'], name: 'index_cookings_on_order_id'
  end

  create_table 'images', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.bigint 'cooking_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cooking_id'], name: 'index_images_on_cooking_id'
  end

  create_table 'inventories', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'total_price', null: false
    t.string 'inventory_month', null: false
    t.bigint 'order_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'supplier_id'
    t.index ['order_id'], name: 'index_inventories_on_order_id'
    t.index ['supplier_id'], name: 'index_inventories_on_supplier_id'
  end

  create_table 'inventory_details', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'unit_price', null: false
    t.integer 'quantity', null: false
    t.integer 'total_price', null: false
    t.string 'product_name', null: false
    t.string 'product_unit', null: false
    t.date 'inventory_day', null: false
    t.bigint 'inventory_id', null: false
    t.bigint 'order_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['inventory_id'], name: 'index_inventory_details_on_inventory_id'
    t.index ['order_id'], name: 'index_inventory_details_on_order_id'
  end

  create_table 'memos', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.text 'text', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'order_id', null: false
    t.index ['order_id'], name: 'index_memos_on_order_id'
  end

  create_table 'orders', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name', null: false
    t.string 'address', null: false
    t.string 'telephone', null: false
    t.index ['email'], name: 'index_orders_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_orders_on_reset_password_token', unique: true
  end

  create_table 'products', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'product_name', null: false
    t.integer 'product_price'
    t.string 'product_unit', null: false
    t.bigint 'supplier_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'availability', default: false, null: false
    t.index ['supplier_id'], name: 'index_products_on_supplier_id'
  end

  create_table 'suppliers', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'name', null: false
    t.string 'telephone', null: false
    t.string 'pic', null: false
    t.string 'website', null: false
    t.index ['email'], name: 'index_suppliers_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_suppliers_on_reset_password_token', unique: true
  end

  create_table 'voucher_details', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'product_name', null: false
    t.integer 'unit_price', null: false
    t.string 'product_unit', null: false
    t.integer 'total_price', null: false
    t.date 'delivery_date', null: false
    t.bigint 'order_id', null: false
    t.bigint 'supplier_id', null: false
    t.bigint 'voucher_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'quantity', null: false
    t.index ['order_id'], name: 'index_voucher_details_on_order_id'
    t.index ['supplier_id'], name: 'index_voucher_details_on_supplier_id'
    t.index ['voucher_id'], name: 'index_voucher_details_on_voucher_id'
  end

  create_table 'vouchers', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.integer 'total_price', null: false
    t.date 'delivery_date', null: false
    t.bigint 'order_id', null: false
    t.bigint 'supplier_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'comment'
    t.integer 'confirm', default: 0, null: false
    t.index ['order_id'], name: 'index_vouchers_on_order_id'
    t.index ['supplier_id'], name: 'index_vouchers_on_supplier_id'
  end

  add_foreign_key 'contract_details', 'contracts'
  add_foreign_key 'contract_details', 'orders'
  add_foreign_key 'contract_details', 'suppliers'
  add_foreign_key 'contracts', 'orders'
  add_foreign_key 'contracts', 'suppliers'
  add_foreign_key 'cookings', 'orders'
  add_foreign_key 'images', 'cookings'
  add_foreign_key 'inventories', 'orders'
  add_foreign_key 'inventory_details', 'inventories'
  add_foreign_key 'inventory_details', 'orders'
  add_foreign_key 'memos', 'orders'
  add_foreign_key 'products', 'suppliers'
  add_foreign_key 'voucher_details', 'orders'
  add_foreign_key 'voucher_details', 'suppliers'
  add_foreign_key 'voucher_details', 'vouchers'
  add_foreign_key 'vouchers', 'orders'
  add_foreign_key 'vouchers', 'suppliers'
end
