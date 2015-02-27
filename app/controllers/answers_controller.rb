class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @user = current_user
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)

    @answer.author = @user.id
    @answer.question = @question.id

    if @answer.save
      render :show
    else
      @errors = @answer.errors
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to question_path
  end

  def answer_params
    params.require(:answer).permit(:content, :question)
  end
end
