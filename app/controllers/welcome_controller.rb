class WelcomeController < ApplicationController
  def index
    @user = User.new
    @questions = Question.all
  end
end
