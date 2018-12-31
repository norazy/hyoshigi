class EntryController < ApplicationController
    def new
        # 入力フォームに記入された内容を保存するための変数
        @entry = Entry.new
        
        # 希望日のセレクトの中に表示させる席の残りを示す配列
        # 本当はallだけど、今日の日付より前のものを呼び出されないように
        # モデルで設定しているafter_todayメソッドを使っている
        @entrydate = Entrydate.after_today
        # 残り座席がゼロの物をはじくためにselectを使っている
        @entrydate = @entrydate.select{|entrydate|
            (entrydate.capacity - (Entry.where(date: entrydate.entrydate)).count ) > 0    
        }
        @capacityleft = @entrydate.map{|entrydate2| entrydate2.capacity - (Entry.where(date: entrydate2.entrydate)).count}.select{|_entryleft| _entryleft > 0}

        # ビューの希望日の選択に表示される文字列全体の変数
        @entrydateView = @entrydate.map.with_index{|entrydate3, index| entrydate3.entrydate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[entrydate3.entrydate.wday]}曜日 %H:%M  ") + "残り" + @capacityleft[index].to_s + "席"}
    end
    
    def confirm
        # binding.pry
        @entrydate = Entrydate.after_today
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
            @course="週1　グループ　1万/月"
        elsif @entry.course==2
            @course="週2　グループ　2万/月"
        elsif @entry.course==3
            @course="週1　個別　3万/月"
        else
            @course="週2　個別　6万/月"
        end
        
        
        # パラムズに入っているデータの型と変数の中のバリューの型が違うから
        # 型を変えてあげる必要がある。
        # でも、この変化はビューのためのもので、hiddenフィールドに渡しているものとは関係ない
        datetime = entry_params[:joindate].to_date
        
        if datetime==Date.new(2019,2,1)
            @entry_month="2019年　2月"
        elsif datetime==Date.new(2019,5,1)
            @entry_month="2019年　5月"
        elsif datetime==Date.new(2019,8,1)
            @entry_month="2019年　8月"
        else
            @entry_month="2019年　11月"
        end
        # binding.pry
    end
    
    def create
        # binding.pry
        @entry = Entry.new(entry_params)

        # 確認で間違いがあった時に戻るために必要な情報↓
        @entrydate = Entrydate.after_today
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
