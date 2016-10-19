class VotesController < ApplicationController
	def new
		@vote = New.new
	end
	def create
		@vote = New.new(vote_params)
		if @vote.save
    redirect_to @vote
  		else
    render 'new'
  		end
	end
	def show
		@vote = New.find(params[:id])
	end
	def index
		@vote = New.all
	end
	def edit
		@vote = New.find(params[:id])
	end
	def update
		@vote = New.find(params[:id])
		if @vote.update(vote_params)
			redirect_to @vote
		else
			render 'edit'
		end
	end

	def destroy
  		@vote = New.find(params[:id])
 		redirect_to @vote if @vote.destroy 
  	end

private
	def vote_params
	params.require(:vote).permit(:title, :text)
	end
end
