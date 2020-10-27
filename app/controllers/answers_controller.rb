class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :load_question, only: %i[create]
  before_action :load_answers, only: %i[create]
  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.create(answer_params)
    if @answer.save
      redirect_to @question, notice: 'The Answer was successfully created'
    else
      render 'questions/show'
    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answers
    @answers = Answer.all
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
