Rails.application.routes.draw do
    scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    # ↑ウェブサイトにアクセスした際に、言語コードをパスに含めるようルーティングを設定します。
        root 'hyoshigis#index'
        # トップページのルーティング
        get 'hyoshigis' => 'hyoshigis#index'
        get 'hyoshigis/why' => 'hyoshigis#why'
        get 'hyoshigis/what' => 'hyoshigis#what'
        get 'hyoshigis/what_kind' => 'hyoshigis#what_kind'
        get 'hyoshigis/how_much' => 'hyoshigis#how_much'
        get 'hyoshigis/where' => 'hyoshigis#where'
        get 'hyoshigis/more' => 'hyoshigis#more'
        get 'hyoshigis/aboutus' => 'hyoshigis#aboutus'
        get 'hyoshigis/recruit' => 'hyoshigis#recruit'
        
        # 資料請求（郵送）
        get 'information' =>'information#new'
        post 'information' => 'information#create'
        post 'information/confirm' => 'information#confirm'
        
        # 資料請求（ダウンロード）
        post 'infodownload' => 'infodownload#create'
        # ダウンロード用のパスでビューはない
        get 'download' => 'infodownload#download'
        
        #体験会
        get 'trial' => 'trial#new'
        post 'trial' => 'trial#create'
        post 'trial/confirm' => 'trial#confirm'
        
        # お問合せ
        get 'inquiry' => 'inquiry#new'
        post 'inquiry' => 'inquiry#create'
        post 'inquiry/confirm' => 'inquiry#confirm'
    
        # 入会申し込み
        get 'entry' => 'entry#new'
        post 'entry' => 'entry#create'
        post 'entry/confirm' => 'entry#confirm'
    end
end
