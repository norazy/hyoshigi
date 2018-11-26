class InfodownloadController < ApplicationController
    def create
        @infodl = Infodownload.new(download_params)
        
        if @infodl.invalid?
            @info = Information.new
            render 'information/new'
        else
            @infodl.save
            # send_file 'public/infodownload.pdf'
        end
    end

    def download
        send_file 'public/infodownload.pdf'        
    end

private
    def download_params
        params.require(:infodownload).permit(:lastname, :firstname, :email)
    end
end
