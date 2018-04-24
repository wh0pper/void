class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Now just wait until someone screams back!"
      redirect_to "/"
    else
      flash[:alert] = "No."
      redirect_to '/scream'
    end
  end

  private

  def question_params
    params.require('/scream').permit(:content)
  end
end
