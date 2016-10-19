class PaymentInfosController < ApplicationController
  before_action :set_payment_info, only: [:show, :edit, :update, :destroy]
  before_action :can_do_it?, except: [:show, :index]

  def index
    @payment_infos = PaymentInfo.all.reverse
  end

  def show
  end

  def new
    @payment_info = PaymentInfo.new
  end

  def edit
  end

  def create
    @payment_info = PaymentInfo.new(payment_info_params)
    @payment_info.save
  end

  def update
    @payment_info.update(payment_info_params)
  end

  def destroy
    @payment_info.destroy
  end

  private

  def set_payment_info
    @payment_info = PaymentInfo.find(params[:id])
  end

  def payment_info_params
    params.require(:payment_info).permit(:title, :text)
  end
end
