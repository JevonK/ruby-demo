class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :name, comment: '用户名称'
      t.string :password, comment: '密码'
      t.string :portrait_url, comment: '头像'
      t.timestamps
    end
  end
end
