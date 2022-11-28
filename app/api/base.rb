class Base < Grape::API
    format 'json'

    helpers BaseHelper
    before do
        Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
        @start_time = Time.now # 记录执行时间
    end
    
    after do
        Rails.logger.info('访问结束，执行时间: ' + (Time.now - @start_time).to_s)
    end
    
    mount Customers
    mount CustomerContacts
    mount CustomerFollows
    mount Admins
end