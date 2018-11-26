class Information < ActiveRecord::Base
    attr_accessor :email_confirmation
    # 記入されているかどうかの確認↓
    validates :lastname, :firstname, :lastnamekana, :firstnamekana, :email,
              :address, :phonenumber1, :phonenumber2, :phonenumber3, presence: true, allow_blank: false

    # カタカナかどうかの判断↓ 
    validates :lastnamekana, :firstnamekana,
        format: {with: /\A([ァ-ン]|ー)+\Z/}
    
    # emailの様式があってるかどうか↓
    validates :email,
        format: {with:  /\A\S+@\S+\.\S+\Z/}

    # # 半角数字のみ、数字のみの判断↓
    validates :phonenumber1, :phonenumber2, :phonenumber3,
        length: {in: 2..5},
        format: {with: /\A[0-9]+\Z/}
        
    validate :email_check, on: :confirm
    
    def email_check
        if email != email_confirmation
            errors.add(:information, "メールアドレスが違います")
        end
    end

end



