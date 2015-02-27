class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
  
    if @question.save
      redirect_to question_path(@question)
    else
      @error = @question.errors
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to question_path(@question)
    else
      @error = @question.errors
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content).merge(author_id: current_user.id)
  end
end