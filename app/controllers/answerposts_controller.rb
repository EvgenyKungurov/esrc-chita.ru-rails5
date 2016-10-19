class AnswerpostsController < ApplicationController
	before_action :sign_in_admin, only: [:index_admin, :answer, :destroy]
	before_action :sign_in, only: [:index]
	def new
		@answerpost = Answerpost.new
	end

	def create
		@answerpost = current_user.answerposts.create(answerpost_params)
		if @answerpost.save
			RespondentMailer.new_question(current_user).deliver_now
			redirect_to @answerpost
		else
			render 'new'
		end
	end

	def edit
		if sign_in_admin?
			@answerpost = Answerpost.find(params[:id])
		else
			@answerpost = current_user.answerposts.find(params[:id])
		end
	end

	def show
		if sign_in_admin? || sign_in_respondent?
			@answerpost = Answerpost.find(params[:id])
		else
			@answerpost = current_user.answerposts.find(params[:id])
		end
	end

	def index
		@answerpost = current_user.answerposts.sort_by {|x| x.created_at }.reverse
	end

	def index_admin
		@answerpost = Answerpost.all.sort_by {|x| x.created_at }.reverse
	end

	def answer
		@answerpost = Answerpost.find(params[:id])
	end

	def update
		@answerpost = Answerpost.find(params[:id])
		if @answerpost.update(answerpost_params)
			redirect_to @answerpost
		else
			render 'edit'
		end
	end

	def destroy
		@answerpost = Answerpost.find(params[:id])
		redirect_to @answerpost if @answerpost.destroy
	end

private
	def answerpost_params
		params.require(:answerpost).permit(:title, :text, :answer)
	end

	def sign_in_admin
    redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_respondent?
  end

  def sign_in
  	redirect_to signin_url, notice: "Вы не авторизованы" unless sign_in?
  end
end
