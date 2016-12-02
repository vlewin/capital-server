class ReceiptsController < ApplicationController
  def index
    render json: Receipt.all

    # AccountBalanceJob.perform_now

  end

  def create
    render json: Receipt.create(params.require(:receipt).permit(:name, :amount))
  end

  def destroy
    Receipt.find(params[:id]).destroy
  end
end
