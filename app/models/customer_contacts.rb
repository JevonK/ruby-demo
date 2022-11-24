class CustomerContacts < ApplicationRecord
    #查询列表并分页
    def self.select_page_data(page, page_size)
        self.limit(page_size).offset((page - 1)*page_size)
    end
end
