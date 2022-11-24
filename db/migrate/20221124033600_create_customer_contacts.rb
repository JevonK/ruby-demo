class CreateCustomerContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_contacts, comment: '客户联系人表' do |t|
      t.integer :customer_id, comment: '客户id', index: true
      t.string  :name, comment: '联系人名称'
      t.integer :sex, comment: '性别', default: 1
      t.string  :department, comment: '部门'
      t.integer :importanc, comment: '重要性', default: 1, index: true
      t.text :phones, comment: '手机号json'
      t.string :telephone, comment: '电话'
      t.string :email, comment: '邮箱'
      t.string :remark, comment: '备注'
      t.timestamps
    end
  end
end
