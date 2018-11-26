class InformationController < ApplicationController

def new
    @info = Information.new
    @infodl = Infodownload.new
end

def confirm
    @infodl = Infodownload.new
    @info = Information.new(info_params)
    @info.email_confirmation = params[:information][:email_confirmation]
    render :new if @info.invalid?
end

def create
    @info = Information.new(info_params)


    if params[:back]
        render :new
    else
        @info.save
    #   redirect_to @task, notice: 'Task was successfully created.'
    # @taskにするとcreateのビューを表示してくれるの
    # else
    #   render :new
    end
    # render :new if params[:back]
end

private
def info_params
    params.require(:information).permit(:lastname, :firstname, :lastnamekana, :firstnamekana, :email, :address, :phonenumber1, :phonenumber2, :phonenumber3)
end

end
