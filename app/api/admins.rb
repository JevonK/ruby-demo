class Admins < Grape::API
    format 'json'
    helpers BaseHerper

    desc "获取跟进人员列表"
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
        self.return_json 'success', 0, Admin.select_page_data(params[:page], params[:page_size])
    end
end