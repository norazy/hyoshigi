class Entrydate < ActiveRecord::Base
    # 今日の日付以降のものは呼び出されないようにするメソッド
    def self.after_today
        where("entrydate > ?", Date.today)
    end
end
