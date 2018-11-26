Rails.application.routes.draw do
    root 'hyoshigis#index'
    
    # トップページのルーティング
    get 'hyoshigis' => 'hyoshigis#index'
    get 'hyoshigis/why' => 'hyoshigis#why'
    get 'hyoshigis/what' => 'hyoshigis#what'
    get 'hyoshigis/what_kind' => 'hyoshigis#what_kind'
    get 'hyoshigis/how_much' => 'hyoshigis#how_much'
    get 'hyoshigis/where' => 'hyoshigis#where'
    get 'hyoshigis/more' => 'hyoshigis#more'
    
    # フォームページのルーティング
    # resources :information, only: [:new, :create]
    get 'information' =>'information#new'
    post 'information' => 'information#create'
    post 'information/confirm' => 'information#confirm'
    
    # フォームの中のダウンロードのルーティング
    post 'infodownload' => 'infodownload#create'
    # get 'infodownload' => 'infodownload#done'
    get 'download' => 'infodownload#download'
end
