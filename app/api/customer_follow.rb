class CustomerFollow < Grape::API
    helpers BaseHerper

    desc "创建联系人"
    params do
        requires :name, type: String, desc: '姓名'
        requires :sex, type: Integer, desc: '性别', default: 1
        requires :department, type: String, desc: '部门'
        requires :importanc, type: Integer, desc: '重要性'
        requires :phones, type: Array[String], desc: '手机号列表'
        requires :telephone, type: Integer, desc: '电话号码'
        requires :email, type: String, desc: '邮箱'
        requires :remark, type: String, desc: '备注'
    end
    before do
        Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
        @start_time = Time.now # 记录执行时间
    end
    after do
        Rails.logger.info('访问结束，执行时间: ' + (Time.now - @start_time).to_s)
    end
    post "save" do
        if Customers.select_page_data(params)
            self.return_json '保存成功', 0, [],             
        else
            self.return_json '保存失败', 0, [],        
        end
    end

    desc "删除更近记录"
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
        customer = Customers.delete(params[:id])
        if customer
            return_json '删除成功', 0, []
        else
            return_json '删除失败', -1, []
        end
    end

    esc "修改是否已完成"
    params[:page], params[:page_size] do
        requires :ids, type: Array[Integer], desc: '主键id集合', allow_blank: false
    end
    before do
        Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
        @start_time = Time.now # 记录执行时间
    end
    after do
        Rails.logger.info('访问结束，执行时间: ' + (Time.now - @start_time).to_s)
    end
    get "edit-status" do
        if Customers.find(params[:ids]).update_all(status: 1)
            return_json '删除成功', 0, []
        else
            return_json '删除失败', -1, []
        end
    end
end