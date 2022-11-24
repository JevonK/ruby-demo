class CreateCustomerFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_follows, comment: '客户跟进表' do |t|
      t.datetime :arrange_time, comment: "安排时间"
      t.integer :admin_id, comment: '负责人', index: true
      t.integer :customer_id, comment: '客户id', index: true
      t.integer :customer_contact_id, comment: '联系人', index: true
      t.integer :contact_type, comment: '联系方式', index: true
      t.integer :level, comment: '跟进阶段', index: true
      t.string :remark, comment: '备注'
      t.integer :status, comment: '是否已完成', default: 0
      t.timestamps
    end
  end
end
