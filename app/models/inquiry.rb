class Inquiry < ActiveRecord::Base
    attr_accessor :email_confirmation
    # 記入されているかどうかの確認↓
    validates :lastname, :firstname, :lastnamekana, :firstnamekana, :email,
              :content, presence: true, allow_blank: false

    # カタカナかどうかの判断↓ 
    validates :lastnamekana, :firstnamekana,
        format: {with: /\A([ァ-ン]|ー)+\Z/}
    
    # emailの様式があってるかどうか↓
    validates :email,
        format: {with:  /\A\S+@\S+\.\S+\Z/}
        
    validate :email_check

    def email_check
        if email != email_confirmation
            errors.add(:email, "が違います")
        end
    end
end
