class FilialsController < ApplicationController
  before_action :can_do_it?, except: [:index, :show]

  def new
    @filial = Filial.new
  end

  def create
    @filial = Filial.new(filial_params)
    if @filial.save
      redirect_to @filial
    else
      render 'new'
    end
  end

  def show
    @filial = Filial.find(params[:id])
  end

  def edit
    @filial = Filial.find(params[:id])
  end

  def update
    @filial = Filial.find(params[:id])
    if @filial.update(filial_params)
      redirect_to @filial
    else
      render 'edit'
    end
  end

  def index
    @filial = Filial.all
  end

  def destroy
    @filial = Filial.find(params[:id])
    redirect_to @filial if @filial.destroy
  end

  private

  def filial_params
    params.require(:filial).permit(:title, :text)
  end
end
