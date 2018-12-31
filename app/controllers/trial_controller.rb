class TrialController < ApplicationController
    def new
        # 入力フォームに記入された内容を保存するための変数
        @trial = Trial.new
        
        # 希望日のセレクトの中に表示させる席の残りの配列
        @trialdate = Trialdate.after_today
        @trialdate = @trialdate.select{ |trialdate2|
            (trialdate2.capacity - (Trial.where(date: trialdate2.trialdate)).count ) > 0
        }
        @capacityleft = @trialdate.map{|trialdate2| trialdate2.capacity - (Trial.where(date: trialdate2.trialdate)).count }.select{|_capacityleft| _capacityleft > 0 }

        # ビューの希望日の選択に表示される文字列全体の変数
        @trialdateView = @trialdate.map.with_index{|trialdate3, index| trialdate3.trialdate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[trialdate3.trialdate.wday]}曜日 %H:%M  ") + "残り" + @capacityleft[index].to_s + "席"}
            # @trialdate.map.with_index{|trialdate3, index|　//trialdateのコードを一つ一つ取り出してtraildate3とindex変数を作る
            # rialdate3.trialdate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[trialdate3.trialdate.wday]}曜日 %H:%M")　trialdateの変数を日本語表記にする
            # @capacityleft[index].to_s + "席"}　//取り出したindex変数を使って、@capacityleft配列のデータを呼び出す
        # binding.pry
    end
    
    def confirm
        @trialdate = Trialdate.after_today
        @trialdate = @trialdate.select{ |trialdate2|
            (trialdate2.capacity - (Trial.where(date: trialdate2.trialdate)).count ) > 0
        }
        @capacityleft = @trialdate.map{|trialdate2| trialdate2.capacity - (Trial.where(date: trialdate2.trialdate)).count }.select{|_capacityleft| _capacityleft > 0 }

        # ビューの希望日の選択に表示される文字列全体の変数
        @trialdateView = @trialdate.map.with_index{|trialdate3, index| trialdate3.trialdate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[trialdate3.trialdate.wday]}曜日 %H:%M  ") + "残り" + @capacityleft[index].to_s + "席"}


        @trial = Trial.new(trial_params)
        render :new if @trial.invalid?

    end
    
    def create
        # binding.pry
        @trial = Trial.new(trial_params)

        # 確認で間違いがあった時に戻るために必要な情報↓
        @trialdate = Trialdate.after_today
        @trialdate = @trialdate.select{ |trialdate2|
            (trialdate2.capacity - (Trial.where(date: trialdate2.trialdate)).count ) > 0
        }
        @capacityleft = @trialdate.map{|trialdate2| trialdate2.capacity - (Trial.where(date: trialdate2.trialdate)).count }.select{|_capacityleft| _capacityleft > 0 }
        @trialdateView = @trialdate.map.with_index{|trialdate3, index| trialdate3.trialdate.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[trialdate3.trialdate.wday]}曜日 %H:%M  ") + "残り" + @capacityleft[index].to_s + "席"}
        
        if params[:back]
            render :new
        else
            @trial.save
        end
    end
    
    private
    def trial_params
        params.require(:trial).permit(:age, :date, :lastname, :firstname, :email, :phonenumber1, :phonenumber2, :phonenumber3)
    end

end



