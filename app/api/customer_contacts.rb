class CustomerContacts < Grape::API
    namespace :customer_contacts do

        desc "获取联系人的列表"
        params do
            requires :page, type: Integer, desc: '页数', default: 1
            requires :page_size, type: Integer, desc: '行数', default: 10
            requires :customer_id, type: Integer, desc: '客户id'
        end
        get "get_list" do
            contact = CustomerContact.select_page_data(params[:page], params[:page_size], params[:customer_id])
            # contact_phones = contact.map{|val| JSON.parse(val.phones)}
            self.return_json 'success', 0, {
                list: contact,
                # contact_phones: contact_phones
            }
        end

        desc "创建联系人"
        params do
            requires :name, type: String, desc: '姓名'
            requires :sex, type: Integer, desc: '性别', default: 1
            requires :department, type: String, desc: '部门'
            requires :importanc, type: Integer, desc: '重要性'
            requires :phones, type: String, desc: '手机号列表'
            requires :telephone, type: Integer, desc: '电话号码'
            requires :email, type: String, desc: '邮箱'
            requires :remark, type: String, desc: '备注'
        end
        post "save" do
            if CustomerContact.create(params)
                self.return_json '保存成功', 0, []            
            else
                self.return_json '保存失败', -1, []       
            end
        end
    end
end