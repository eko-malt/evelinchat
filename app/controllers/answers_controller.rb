class AnswersController < ApplicationController
  before_action :set_answer, only: [:update, :destroy]

  def index
    @answers = Answer.order(created_at: :desc)
    @answer = Answer.new
  end

  def update
  end

  def create
    @answer = Answer.new(answer_params)
    return unless @answer.save
    redirect_to root_path
  end

  def destroy
    @answer.destroy
  end

  def answer_params
    params.require(:answer).permit!
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end