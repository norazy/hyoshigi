class InquiryController < ApplicationController
    def new
        @inquiry = Inquiry.new
    end
    
    def confirm
        # binding.pry
        @inquiry = Inquiry.new(inquiry_params)
        @inquiry.email_confirmation = params[:inquiry][:email_confirmation]

        render :new if @inquiry.invalid?
    end
    
    def create
        @inquiry = Inquiry.new(inquiry_params)
        if params[:back]
            render :new
        else
            @inquiry.save
        end
    end
    
    private
    def inquiry_params
        params.require(:inquiry).permit(:lastname, :firstname, :lastnamekana, :firstnamekana, :email, :content)
    end
end
