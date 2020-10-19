class AnswersController < ApplicationController
  before_action :load_question, only: %i[create]

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.create(answer_params)
    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end