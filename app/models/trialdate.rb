class Trialdate < ActiveRecord::Base
    # 今日の日付以降のものは呼び出されないようにするメソッド
    def self.after_today
        where("trialdate > ?", Date.today)
    end
end
