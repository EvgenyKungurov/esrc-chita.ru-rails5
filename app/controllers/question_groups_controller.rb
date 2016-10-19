class QuestionGroupsController < ApplicationController
  respond_to :html, :json
  before_action :set_question_group, only: [:show, :edit, :update, :destroy]

  def index
    @question_groups = QuestionGroup.all
    respond_with(@question_groups)
  end

  def show
    respond_with(@question_group)
  end

  def new
    @question_group = QuestionGroup.new
    respond_with(@question_group)
  end

  def edit
  end

  def create
    @question_group = QuestionGroup.new(question_group_params)
    @question_group.save
    respond_with(@question_group)
  end

  def update
    @question_group.update(question_group_params)
    respond_with(@question_group)
  end

  def destroy
    @question_group.destroy
    respond_with(@question_group)
  end

  private
    def set_question_group
      @question_group = QuestionGroup.find(params[:id])
    end

    def question_group_params
      params.require(:question_group).permit(:name)
    end
end
