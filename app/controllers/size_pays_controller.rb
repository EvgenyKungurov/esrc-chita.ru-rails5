class SizePaysController < ApplicationController
  before_action :set_size_pay, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_admin, only: [:edit, :update, :destroy, :new]

  def index
    @size_pays = SizePay.all
  end

  def show

  end

  def new
    @size_pay = SizePay.new
  end

  def edit
  end

  def create
    @size_pay = SizePay.new(size_pay_params)
    if @size_pay.save
      redirect_to @size_pay
    else
      render :new
    end
  end

  def update
    if @size_pay.update(size_pay_params)
      redirect_to @size_pay
    else
      render :edit
    end
  end

  def destroy
    redirect_to @size_pay   if @size_pay.destroy
  end

  private

  def set_size_pay
    @size_pay = SizePay.find(params[:id])
  end

  def size_pay_params
    params[:size_pay].permit(:name)
  end

  def sign_in_admin
    redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
  end
end
