class ServicetextsController < ApplicationController
	before_action :sign_in_admin, only: [:edit, :update, :destroy, :new]

	def new
		@servicetext = Servicetext.new
	end

	def create
		@servicetext = Servicetext.new(servicetext_params)
		if @servicetext.save
		  redirect_to @servicetext
		else
	render 'new'
		end
	end

	def show
		@servicetext = Servicetext.find(params[:id])
		#@content = Service.find(params[:id])
	end

	def index
		@servicetext = Servicetext.select {|x| x.service_id == params[:format].to_i}
	end

	def edit
		@servicetext = Servicetext.find(params[:id])
	end

	def update
		@servicetext = Servicetext.find(params[:id])
		if @servicetext.update(servicetext_params)
			redirect_to @servicetext
		else
			render 'edit'
		end
	end

	def destroy
		@servicetext = Servicetext.find(params[:id])
		redirect_to @servicetext if @servicetext.destroy
	end

private
	def servicetext_params
		params.require(:servicetext).permit(:title, :text, :service_id)
	end

	def sign_in_admin
	  redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
	end
end
