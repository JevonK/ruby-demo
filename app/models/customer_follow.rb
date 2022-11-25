class CustomerFollow < ApplicationRecord
    belongs_to :admin
    belongs_to :customer_contact
    #查询列表并分页
    def self.select_page_data(page, page_size, customer_id)
        self.includes(:admin, :customer_contact).where(customer_id: customer_id).limit(page_size).offset((page - 1)*page_size)
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
