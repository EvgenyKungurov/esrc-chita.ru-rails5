class InformationsController < ApplicationController
  before_action :can_do_it?, except: [:index, :show]

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to @information
    else
      render 'new'
    end
  end

  def edit
    @information = Information.find(params[:id])
  end

  def show
    @information = Information.find(params[:id])
  end

  def index
    @information = Information.all.reverse
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to @information
    else
      render 'edit'
    end
  end

  def destroy
    @information = Information.find(params[:id])
    redirect_to @information if @information.destroy
  end

  private

  def information_params
    params.require(:information).permit(:title, :text)
  end
end
