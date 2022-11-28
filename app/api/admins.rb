class Admins < Grape::API
    namespace :admins do

        desc "获取跟进人员列表"
        params do
            requires :page, type: Integer, desc: '页数'
            requires :page_size, type: Integer, desc: '行数'
        end
        get "get_list" do
            self.return_json 'success', 0, {
                list: Admin.select_page_data(params[:page], params[:page_size]),
                total: Admin.count
            }
        end
    end
end