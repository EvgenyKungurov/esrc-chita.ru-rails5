class AboutesController < ApplicationController
	before_action :sign_in_admin, only: [:edit, :update, :destroy]

	def index
		@aboute = Aboute.all
	end

	def edit
		@aboute = Aboute.find(params[:id])
	end

	def new
		@aboute = Aboute.new
	end

	def create
		@aboute = Aboute.new(service_params)
		if @aboute.save
    	redirect_to @aboute
  	else
    	render 'new'
  	end
	end

	def show
		@aboute = Aboute.find(params[:id])
	end

	def update
		@aboute = Aboute.find(params[:id])
		if @aboute.update(service_params)
			redirect_to @aboute
		else
			render 'edit'
		end
	end

  def destroy
  	@aboute = Aboute.find(params[:id])
 	  redirect_to @aboute if @aboute.destroy
  end

private
	def service_params
		params.require(:aboute).permit(:text)
	end

	def sign_in_admin
    redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
	end
end
