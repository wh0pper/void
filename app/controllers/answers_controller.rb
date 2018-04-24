class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Now just wait until someone screams back!"
      redirect_to question_path(@answer.question)
    else
      flash[:alert] = "No."
      render :new
    end
  end

  def show
    @answer = Question.find(params[:id])
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
