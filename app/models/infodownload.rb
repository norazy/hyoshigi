class Infodownload < ActiveRecord::Base
    # 記入されているかどうかの確認↓
    validates :lastname, :firstname, :email, presence: true, allow_blank: false
    
    # emailの様式があってるかどうか↓
    validates :email,
        format: {with: /\A\S+@\S+\.\S+\Z/}
    
end
