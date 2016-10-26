class ServicesController < ApplicationController
  before_action :can_do_it?, except: [:index, :show]

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to @service
    else
      render 'new'
    end
  end

  def show
    @service = Service.find(params[:id]).servicetexts
    @content = Service.find(params[:id])
  end

  def index
    @service = Service.all.sort_by(&:type_service).reverse
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to @service
    else
      render 'edit'
    end
  end

  def destroy
    @service = Service.find(params[:id])
    redirect_to @service if @service.destroy
  end

  private

  def service_params
    params.require(:service).permit(:title, :text, :position, :type_service)
  end
end
