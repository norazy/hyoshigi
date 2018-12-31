class Entry < ActiveRecord::Base
    # 記入されているかどうかの確認↓
    validates :p_lastname, :p_firstname, :p_lastnamekana, :p_firstnamekana, :email, :joindate,
                :address, :phonenumber1, :phonenumber2, :phonenumber3,
                :lastname, :firstname, :lastnamekana, :firstnamekana, :birthday, :gender, :course, :date,
               presence: true, allow_blank: false

    # カタカナかどうかの判断↓ 
    validates :lastnamekana, :firstnamekana, :p_lastnamekana, :p_firstnamekana,
        format: {with: /\A([ァ-ン]|ー)+\Z/}
    
    # emailの様式があってるかどうか↓
    validates :email,
        format: {with:  /\A\S+@\S+\.\S+\Z/}

    # # 半角数字のみ、数字のみの判断↓
    validates :phonenumber1, :phonenumber2, :phonenumber3,
        length: {in: 2..5},
        format: {with: /\A[0-9]+\Z/}
        
    # validate :date_valid?

    # def date_valid?
    #     date = birthday_before_type_cast
    #     y = birthday[0, 4].to_i
    #     m = birthday[4, 2].to_i
    #     d = birthday[6, 2].to_i

    #     if date.valid_date?(y, m, d)
    #         errors.add(:birthday, "日付の値が不正です")
    #     end
    # end
end
