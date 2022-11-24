class Customer < Grape::API

    format 'json'
    helpers BaseHerper

    desc "获取客户的列表"
    params do
        requires :page, type: Integer, desc: '页数'
        requires :page_size, type: Integer, desc: '行数'
    end
    before do
        Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
        @start_time = Time.now # 记录执行时间
    end
    after do
        Rails.logger.info('访问结束，执行时间: ' + (Time.now - @start_time).to_s)
    end
    get "get-list" do
        self.return_json 'success', 0, Customers.select_page_data(params[:page], params[:page_size])
    end

    desc "保存客户"
    params[:page], params[:page_size] do
        requires :id, type: Integer, desc: '主键id', default: 0
        requires :name, type: String, desc: '名称', allow_blank: false
        requires :phone, type: String, desc: '手机号'
        requires :postal_code, type: Integer, desc: '邮政编码'
        requires :address, type: String, desc: '地址'
    end
    before do
        Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
        @start_time = Time.now # 记录执行时间
    end
    after do
        Rails.logger.info('访问结束，执行时间: ' + (Time.now - @start_time).to_s)
    end
    post "save" do
        if Customers.create_or_update(params)
            self.return_json "#{id ? '修改' : '保存'}成功" 0, []
        else
            self.return_json "#{id ? '修改' : '保存'}失败", 0, []
        end
        
    end

    desc "显示单客户"
    params[:page], params[:page_size] do
        requires :id, type: Integer, desc: '主键id', allow_blank: false
    end
    before do
        Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
        @start_time = Time.now # 记录执行时间
    end
    after do
        Rails.logger.info('访问结束，执行时间: ' + (Time.now - @start_time).to_s)
    end
    get "show" do
        customer = Customers.includes(:customer_follows, :customer_contacts).find(params[:id])
        customer_follows = customer.customer_follows
        customer_contacts = customer.customer_contacts
        return_json 'success', 0, {customer_contacts: customer_contacts, customer: customer, customer_follows: customer_follows}
    end

    desc "删除客户"
    params[:page], params[:page_size] do
        requires :id, type: Integer, desc: '主键id', allow_blank: false
    end
    before do
        Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
        @start_time = Time.now # 记录执行时间
    end
    after do
        Rails.logger.info('访问结束，执行时间: ' + (Time.now - @start_time).to_s)
    end
    get "del" do
        if Customers.delete(params[:id])
            return_json '删除成功', 0, []
        else
            return_json '删除失败', -1, []
        end
    end

end