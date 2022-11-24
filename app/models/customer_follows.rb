class CustomerFollows < ApplicationRecord
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
