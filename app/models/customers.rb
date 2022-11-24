class Customers < ApplicationRecord
    has_many :customer_follows, dependent: :destroy
    has_many :customer_contacts, dependent: :destroy
    belongs_to :admin

    #查询列表并分页
    def self.select_page_data(page, page_size)
        self.limit(page_size).offset((page - 1)*page_size)
    end

    #保存或添加
    def self.create_or_update(data)
        id = data[:id]
        data.delete(:id)
        if id
            self.find(id).update(data)
        else
            self.create(data)
        end
    end
end
