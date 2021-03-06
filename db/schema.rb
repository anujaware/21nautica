# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150302165619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_of_ladings", force: true do |t|
    t.string   "bl_number"
    t.string   "payment_ocean"
    t.string   "cheque_ocean"
    t.string   "payment_clearing"
    t.string   "cheque_clearing"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "agency_fee"
    t.string   "shipping_line_charges"
  end

  add_index "bill_of_ladings", ["bl_number"], name: "index_bill_of_ladings_on_bl_number", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "emails"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "espinita_audits", force: true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.text     "audited_changes"
    t.string   "comment"
    t.integer  "version"
    t.string   "action"
    t.string   "remote_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "espinita_audits", ["auditable_id", "auditable_type"], name: "index_espinita_audits_on_auditable_id_and_auditable_type", using: :btree
  add_index "espinita_audits", ["user_id", "user_type"], name: "index_espinita_audits_on_user_id_and_user_type", using: :btree

  create_table "export_items", force: true do |t|
    t.string   "container"
    t.string   "location"
    t.string   "weight"
    t.integer  "export_id"
    t.integer  "movement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_placement"
  end

  add_index "export_items", ["export_id"], name: "index_export_items_on_export_id", using: :btree

  create_table "exports", force: true do |t|
    t.string   "equipment"
    t.integer  "quantity"
    t.string   "export_type"
    t.string   "shipping_line"
    t.integer  "placed"
    t.string   "release_order_number"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "moved"
  end

  add_index "exports", ["customer_id"], name: "index_exports_on_customer_id", using: :btree

  create_table "import_expenses", force: true do |t|
    t.integer  "import_item_id"
    t.string   "category"
    t.string   "name"
    t.string   "amount"
    t.string   "currency"
    t.string   "invoice_date"
    t.string   "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invoice_number"
  end

  add_index "import_expenses", ["import_item_id"], name: "index_import_expenses_on_import_item_id", using: :btree

  create_table "import_items", force: true do |t|
    t.string   "container_number"
    t.string   "trailer_number"
    t.string   "tr_code"
    t.string   "truck_number"
    t.string   "current_location"
    t.string   "bond_direction"
    t.string   "bond_number"
    t.string   "status"
    t.integer  "import_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remarks"
    t.string   "yard_name"
    t.datetime "g_f_expiry"
    t.datetime "close_date"
    t.string   "after_delivery_status"
    t.string   "context"
    t.integer  "vendor_id"
  end

  add_index "import_items", ["container_number"], name: "index_import_items_on_container_number", using: :btree
  add_index "import_items", ["import_id"], name: "index_import_items_on_import_id", using: :btree
  add_index "import_items", ["vendor_id"], name: "index_import_items_on_vendor_id", using: :btree

  create_table "imports", force: true do |t|
    t.string   "equipment"
    t.integer  "quantity"
    t.string   "from"
    t.string   "to"
    t.string   "bl_number"
    t.date     "estimate_arrival"
    t.string   "description"
    t.string   "rate"
    t.string   "status"
    t.date     "out_of_port_date"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shipping_line"
    t.string   "work_order_number"
    t.string   "remarks"
    t.string   "clearing_agent"
    t.string   "bill_of_lading_id"
    t.string   "rate_agreed"
    t.string   "weight"
    t.integer  "clearing_agent_id"
  end

  add_index "imports", ["bill_of_lading_id"], name: "index_imports_on_bill_of_lading_id", using: :btree
  add_index "imports", ["clearing_agent_id"], name: "index_imports_on_clearing_agent_id", using: :btree
  add_index "imports", ["customer_id"], name: "index_imports_on_customer_id", using: :btree

  create_table "invoices", force: true do |t|
    t.string   "number"
    t.date     "date"
    t.string   "document_number"
    t.integer  "amount",              default: 0
    t.string   "status"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "previous_invoice_id"
    t.integer  "invoiceable_id"
    t.string   "invoiceable_type"
    t.string   "legacy_bl"
    t.string   "remarks"
  end

  create_table "movements", force: true do |t|
    t.string   "booking_number"
    t.string   "truck_number"
    t.string   "vessel_targeted"
    t.string   "port_of_discharge"
    t.string   "port_of_loading"
    t.date     "estimate_delivery"
    t.string   "movement_type"
    t.string   "custom_seal"
    t.string   "remarks"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "w_o_number"
    t.string   "bill_of_lading_id"
    t.string   "clearing_agent"
    t.string   "clearing_agent_payment"
    t.string   "transporter_payment"
    t.date     "transporter_invoice_date"
    t.string   "transporter_invoice_number"
    t.date     "clearing_agent_invoice_date"
    t.string   "clearing_agent_invoice_number"
    t.integer  "vendor_id"
    t.integer  "clearing_agent_id"
  end

  add_index "movements", ["bill_of_lading_id"], name: "index_movements_on_bill_of_lading_id", using: :btree
  add_index "movements", ["clearing_agent_id"], name: "index_movements_on_clearing_agent_id", using: :btree
  add_index "movements", ["vendor_id"], name: "index_movements_on_vendor_id", using: :btree

  create_table "particulars", force: true do |t|
    t.integer  "invoice_id"
    t.string   "name"
    t.integer  "rate"
    t.integer  "quantity"
    t.integer  "subtotal",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "particulars", ["invoice_id"], name: "index_particulars_on_invoice_id", using: :btree

  create_table "payments", force: true do |t|
    t.date     "date_of_payment"
    t.integer  "amount"
    t.string   "mode_of_payment"
    t.string   "reference"
    t.string   "remarks"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "vendor_id"
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id", using: :btree
  add_index "payments", ["vendor_id"], name: "index_payments_on_vendor_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vendor_type"
  end

end
