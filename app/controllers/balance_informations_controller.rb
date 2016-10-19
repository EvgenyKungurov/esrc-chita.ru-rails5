class BalanceInformationsController < ApplicationController
  before_action :set_balance_information, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_admin, except: [:show, :index]

  def index
    @balance_informations = BalanceInformation.all
  end

  def show
  end

  def new
    @balance_information = BalanceInformation.new
  end

  def edit
  end

  def create
    @balance_information = BalanceInformation.new(balance_information_params)
    if @balance_information.save
      redirect_to @balance_information
    else
      render :new
    end
  end

  def update
    if @balance_information.update(balance_information_params)
      redirect_to @balance_information
    else
      render :edit
    end
  end

  def destroy
    redirect_to balance_informations_path if @balance_information.destroy
  end

  private
    def set_balance_information
      @balance_information = BalanceInformation.find(params[:id])
    end

    def balance_information_params
      params.require(:balance_information).permit(:title, :content)
    end

    def sign_in_admin
      redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
    end
end
