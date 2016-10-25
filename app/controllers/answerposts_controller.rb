class AnswerpostsController < ApplicationController
  before_action :can_do_it?, only: [:index_admin, :answer, :destroy]
  before_action :belongs_to_user?, only: [:edit, :show]

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
    @answerpost = current_user.answerposts.find(params[:id])
  end

  def show
    @answerpost = current_user.answerposts.find(params[:id])
  end

  def index
    @answerpost = current_user.answerposts.sort_by(&:created_at).reverse
  end

  def index_admin
    @answerpost = Answerpost.all.sort_by(&:created_at).reverse
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

  def belongs_to_user?
    redirect_to root_path unless current_user.answerposts.map(&:id).include? params[:id]
  end

  def answerpost_params
    params.require(:answerpost).permit(:title, :text, :answer)
  end
end
