class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, comment: '客户信息' do |t|
      t.string :name, comment: '公司名称'
      t.string :phone, comment: '联系电话'
      t.integer :postal_code, comment: '邮政编码'
      t.string :address, comment: '公司地址'
      t.string :admin_id, comment: '负责人'
      t.timestamps
    end
  end
end
