class CustomerContact < ApplicationRecord
    #查询列表并分页
    def self.select_page_data(page, page_size, customer_id)
        self.where(customer_id: customer_id).limit(page_size).offset((page - 1)*page_size)
    end
end
