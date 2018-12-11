class EntryController < ApplicationController
    def new
        # 入力フォームに記入された内容を保存するための変数
        @entry = Entry.new
        
        # 希望日のセレクトの中に表示させる席の残りを示す配列
        @entrydate = Entrydate.all
        # 残り座席がゼロの物をはじくためにselectを使っている
        @entrydate = @entrydate.select{|entrydate|
            (entrydate.capacity - (Entry.where(date: entrydate.entrydate)).count ) > 0    
        }
        @capacityleft = @entrydate.map{|entrydate2| entrydate2.capacity - (Entry.where(date: entrydate2.entrydate)).count}.select{|_entryleft| _entryleft > 0}

        # ビューの希望日の選択に表示される文字列全体の変数
        @entrydateView = @entrydate.map.with_index{|entrydate3, index| entrydate3.entrydate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[entrydate3.entrydate.wday]}曜日 %H:%M  ") + "残り" + @capacityleft[index].to_s + "席"}
    end
    
    def confirm
        @entrydate = Entrydate.all
        @entrydate = @entrydate.select{|entrydate|
            (entrydate.capacity - (Entry.where(date: entrydate.entrydate)).count ) > 0    
        }
        @capacityleft = @entrydate.map{|entrydate2| entrydate2.capacity - (Entry.where(date: entrydate2.entrydate)).count}.select{|_entryleft| _entryleft > 0}

        # ビューの希望日の選択に表示される文字列全体の変数
        @entrydateView = @entrydate.map.with_index{|entrydate3, index| entrydate3.entrydate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[entrydate3.entrydate.wday]}曜日 %H:%M  ") + "残り" + @capacityleft[index].to_s + "席"}

        @entry = Entry.new(entry_params)    
        render :new if @entry.invalid?
                
        if @entry.gender==1
            @gender="男"
        else
            @gender="女"
        end
        
        if @entry.course==1
            @course="週１　グループ　１万/月"
        elsif @entry.course==2
            @course="週２　グループ　２万/月"
        elsif @entry.course==3
            @course="週２　個別　３万/月"
        else
            @course="週２　個別　６万/月"
        end
        
        if @entry.joindate==2019-01-01
            @entry_month="２０１９年　１月"
        elsif @entry.joindate==2019-02-01
            @entry_month="２０１９年　２月"
        elsif @entry.joindate==2019-03-01
            @entry_month="２０１９年　３月"
        else
            @entry_month="２０１９年　４月"
        end
    end
    
    def create
        # binding.pry
        @entry = Entry.new(entry_params)

        # 確認で間違いがあった時に戻るために必要な情報↓
        @entrydate = Entrydate.all
        @entrydate = @entrydate.select{|entrydate|
            (entrydate.capacity - (Entry.where(date: entrydate.entrydate)).count ) > 0    
        }
        @capacityleft = @entrydate.map{|entrydate2| entrydate2.capacity - (Entry.where(date: entrydate2.entrydate)).count}.select{|_entryleft| _entryleft > 0}
        @entrydateView = @entrydate.map.with_index{|entrydate3, index| entrydate3.entrydate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[entrydate3.entrydate.wday]}曜日 %H:%M  ") + "残り" + @capacityleft[index].to_s + "席"}
        
        if params[:back]
            render :new
            # redirect_to entry_path
            # redirect_to entry_path(entry_params)
        else
            5.times do
                number = SecureRandom.hex(8)
                if Entry.find_by(securenumber: number).nil?
                    @entry.securenumber = number
                    @entry.save
                    return
                end
            end
        end
    end
    
    private
    def entry_params
        params.require(:entry).permit(:p_lastname, :p_firstname, :p_lastnamekana, :p_firstnamekana, :email,
                :address, :phonenumber1, :phonenumber2, :phonenumber3,
                :lastname, :firstname, :lastnamekana, :firstnamekana, :birthday, :gender, :course, :joindate, :date, :securenumber)
    end
end
