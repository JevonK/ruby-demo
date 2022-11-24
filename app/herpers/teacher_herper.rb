module TeacherHerper
    def full_name(teacher_id)
        t = Teacher.find_by_id(teacher_id)
        return '数据错误，不存在对应的老师！' if t.blank?
        t.name
    end
end