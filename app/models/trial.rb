class Trial < ActiveRecord::Base

    validates :age, :date, :lastname, :firstname, :email,
              :phonenumber1, :phonenumber2, :phonenumber3, presence: true, allow_blank: false

    # emailの様式があってるかどうか↓
    validates :email,
        format: {with:  /\A\S+@\S+\.\S+\Z/}

    # 半角数字のみ、数字のみの判断↓
    validates :phonenumber1, :phonenumber2, :phonenumber3,
        length: {in: 2..5},
        format: {with: /\A[0-9]+\Z/}    
end
