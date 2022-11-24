class AddInitialAdmin < ActiveRecord::Migration[7.0]
  def up
    Admin.create([
      {name: '张三', password: (123456)},
      {name: '李四', password: (123456)},
      {name: '王五', password: (123456)},
      {name: '赵六', password: (123456)},
    ])
  end
  def down
    Product.delete_all
  end
end
