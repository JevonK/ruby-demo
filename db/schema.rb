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

ActiveRecord::Schema[7.0].define(version: 2022_11_24_052407) do
  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name", comment: "用户名称"
    t.string "password", comment: "密码"
    t.string "portrait_url", comment: "头像"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_contacts", charset: "utf8mb4", collation: "utf8mb4_bin", comment: "客户联系人表", force: :cascade do |t|
    t.integer "customer_id", comment: "客户id"
    t.string "name", comment: "联系人名称"
    t.integer "sex", default: 1, comment: "性别"
    t.string "department", comment: "部门"
    t.integer "importanc", default: 1, comment: "重要性"
    t.text "phones", comment: "手机号json"
    t.string "telephone", comment: "电话"
    t.string "email", comment: "邮箱"
    t.string "remark", comment: "备注"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_contacts_on_customer_id"
    t.index ["importanc"], name: "index_customer_contacts_on_importanc"
  end

  create_table "customer_follows", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.datetime "arrange_time", comment: "安排时间"
    t.integer "admin_id", comment: "负责人"
    t.integer "customer_id", comment: "客户id"
    t.integer "customer_contact_id", comment: "联系人"
    t.integer "contact_type", comment: "联系方式"
    t.integer "level", comment: "跟进阶段"
    t.string "remark", comment: "备注"
    t.integer "status", default: 0, comment: "是否已完成"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_customer_follows_on_admin_id"
    t.index ["contact_type"], name: "index_customer_follows_on_contact_type"
    t.index ["customer_contact_id"], name: "index_customer_follows_on_customer_contact_id"
    t.index ["customer_id"], name: "index_customer_follows_on_customer_id"
    t.index ["level"], name: "index_customer_follows_on_level"
  end

  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_bin", comment: "客户信息", force: :cascade do |t|
    t.string "name", comment: "公司名称"
    t.string "phone", comment: "联系电话"
    t.integer "postal_code", comment: "邮政编码"
    t.string "address", comment: "公司地址"
    t.string "admin_id", comment: "负责人"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
