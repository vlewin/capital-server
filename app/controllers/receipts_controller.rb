class ReceiptsController < ApplicationController
  def index
    render json: Receipt.all
  end

  def create
    render json: Receipt.create(params.require(:receipt).permit(:name, :amount))
  end
end
