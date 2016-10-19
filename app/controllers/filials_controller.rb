class FilialsController < ApplicationController
	before_action :sign_in_admin, only: [:edit, :update, :destroy]

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

	def sign_in_admin
      redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
    end 
end
