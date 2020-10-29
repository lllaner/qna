class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :load_question, only: %i[create]
  before_action :load_answer, only: %i[destroy]
  before_action :load_answers, only: %i[create]

  def create
    @answer = @question.answers.create(answer_params.merge(user_id: current_user.id))
    if @answer.save
      redirect_to @question, notice: 'The Answer was successfully created'
    else
      render 'questions/show'
    end
  end

  def destroy
    if @answer.user == current_user && @answer.destroy
      redirect_to question_path(@answer.question), notice: 'The answer was successfully deleted.'
    else
      render :show
    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def load_answers
    @answers = Answer.all
  end

  def answer_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end
