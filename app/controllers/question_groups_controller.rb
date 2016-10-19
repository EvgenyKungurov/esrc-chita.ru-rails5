class QuestionGroupsController < ApplicationController
  before_action :set_question_group, only: [:show, :edit, :update, :destroy]

  def index
    @question_groups = QuestionGroup.all
  end

  def show
  end

  def new
    @question_group = QuestionGroup.new
  end

  def edit
  end

  def create
    @question_group = QuestionGroup.new(question_group_params)
    @question_group.save
  end

  def update
    @question_group.update(question_group_params)
  end

  def destroy
    @question_group.destroy
  end

  private

  def set_question_group
    @question_group = QuestionGroup.find(params[:id])
  end

  def question_group_params
    params.require(:question_group).permit(:name)
  end
end
