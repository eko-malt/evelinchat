class QuestionsController < ApplicationController
  before_action :set_question, only: [:update, :destroy]

  def index
    @questions = Question.order(created_at: :desc)
    @answers = Answer.order(created_at: :desc)
    @question = Question.new
    @answer = Answer.new
  end

  def update
  end

  def create
    @question = Question.new(question_params)
    return unless @question.save
    redirect_to root_path
  end

  def destroy
    @question.destroy
  end

  def question_params
    params.require(:question).permit!
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
