class Customer < ApplicationRecord
    has_many :customer_follow, dependent: :destroy
    has_many :customer_contact, dependent: :destroy
    belongs_to :admin

    #查询列表并分页
    def self.select_page_data(page, page_size)
        self.includes(:admin).limit(page_size).offset((page - 1)*page_size)
    end

    #保存或添加
    def self.create_or_update(data)
        id = data[:id]
        data.delete(:id)
        if id != 0
            self.find(id).update(data)
        else
            self.create(data)
        end
    end
end
