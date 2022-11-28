class CustomerFollows < Grape::API
    namespace :customer_follows do

        desc "获取跟进人的列表"
        params do
            requires :page, type: Integer, desc: '页数', default: 1
            requires :page_size, type: Integer, desc: '行数', default: 10
            requires :customer_id, type: Integer, desc: '客户id'
        end
        get "get_list" do
            follow = CustomerFollow.select_page_data(params[:page], params[:page_size], params[:customer_id])
            follow_not = follow.filter_map{|val| val if val.status == 0}
            follow_success = follow.filter_map{|val| val if val.status == 1}
            follow_admin = {}
            follow.filter_map{|val| follow_admin[val.admin.id] = val.admin}
            follow_contact = {}
            follow.each{|val| follow_contact[val.customer_contact.id] = val.customer_contact}
            self.return_json 'success', 0, {
                follow_not: follow_not,
                follow_success: follow_success,
                follow_admin: follow_admin,
                follow_contact: follow_contact,
            }
        end

        desc "创建联系人"
        params do
            requires :id, type: Integer, desc: '主键',default: 0
            requires :arrange_time, type: String, desc: '安排时间'
            requires :admin_id, type: Integer, desc: '跟进人id'
            requires :customer_id, type: Integer, desc: '客户id'
            requires :customer_contact_id, type: Integer, desc: '联系人id'
            requires :contact_type, type: Integer, desc: '重要性'
            requires :level, type: Integer, desc: '跟进阶段'
            requires :status, type: Integer, desc: '是否已完成'
            requires :remark, type: String, desc: '备注'
        end
        post "save" do
            if CustomerFollow.create_or_update(params)
                self.return_json('保存成功', 0, [])
            else
                self.return_json('保存失败', 0, [])
            end
        end

        desc "删除更近记录"
        params do
            requires :id, type: Integer, desc: '主键id', allow_blank: false
        end
        get "del" do
            customer = CustomerFollow.delete(params[:id])
            if customer
                return_json '删除成功', 0, []
            else
                return_json '删除失败', -1, []
            end
        end

        desc "修改是否已完成"
        params do
            requires :ids, desc: '主键id集合', allow_blank: false
        end
        before do
            unless params[:ids]
                return_json '删除成功', 0, []
            end
            Rails.logger.info('接口开始访问，开始时间：' + Time.now.to_s)
            @start_time = Time.now # 记录执行时间
        end
        post "edit_status" do
            if CustomerFollow.where(id: params[:ids].filter_map{|val| val if val != 0}).update_all(status: 1)
                return_json '修改成功', 0, []
            else
                return_json '修改失败', -1, []
            end
        end
    end
end