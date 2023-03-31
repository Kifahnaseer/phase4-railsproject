class PaymentsController < ApplicationController
    def new
        @payment = Payment.new
    end
      
    def create
        @payment = Payment.new(payment_params)
        if @payment.valid?
        # Simulate payment success
        redirect_to root_path, notice: "Payment was successful!"
        else
        render :new
        end
    end
      
    private
      
    def payment_params
        params.require(:payment).permit(:amount, :credit_card_number, :expiration_date, :cvv)
    end
end
