class InformationController < ApplicationController

def new
    @info = Information.new
end

def confirm
    @info = Information.new(info_params)
    render :new if @info.invalid?
    # binding.pry
end

def create
    @info = Information.new(info_params)
    binding.pry
    # render :new if params[:back]
    if params[:back]
        render :new
    else
        @info.save
    #   redirect_to @task, notice: 'Task was successfully created.'
    # @taskにするとcreateのビューを表示してくれるの
    # else
    #   render :new
    end
end

private
def info_params
    params.require(:information).permit(:lastname, :firstname, :lastnamekana, :firstnamekana, :email, :email_confirmation, :address, :phonenumber1, :phonenumber2, :phonenumber3)
end

end
