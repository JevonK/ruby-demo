module BaseHerper
    def return_json(msg, code = 200, data = [])
        {
            msg: msg,
            code: code,
            data: data
        }
    end
end