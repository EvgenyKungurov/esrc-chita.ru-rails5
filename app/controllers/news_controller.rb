class NewsController < ApplicationController
	def new
		@new = New.new
	end
	def create
		@new = New.new(new_params)
		if @new.save
    redirect_to @new
  		else
    render 'new'
  		end
	end
	def show
		@new = New.find(params[:id])
	end
	def index
		@new = New.all
	end
	def edit
		@new = New.find(params[:id])
	end
	def update
		@new = New.find(params[:id])
		if @new.update(new_params)
			redirect_to @new
		else
			render 'edit'
		end
	end

	def destroy
  		@new = New.find(params[:id])
 		redirect_to @new if @new.destroy 
  	end

private
	def new_params
	params.require(:new).permit(:title, :text)
	end
end
