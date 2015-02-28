class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    render :_new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)

    @answer.author = current_user

    if @answer.save
      redirect_to question_answers_path
    else
      @errors = @answer.errors
      render :_new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    @answer.attributes = answer_params
    @answer.save

    redirect_to questions_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy

    redirect_to questions_path(@question)
  end

  def upvote
    if logged_in?
      answer = Answer.find(params[:answer_id])
      vote = Vote.find_or_initialize_by(votable: answer, voter: current_user)
      vote.up
      vote.save
      render json: { vote_count: answer.vote_count }
    end
  end

  def downvote
    if logged_in?
      answer = Answer.find(params[:answer_id])
      vote = Vote.find_or_initialize_by(votable: answer, voter: current_user)
      vote.down
      vote.save
      render json: { vote_count: answer.vote_count }
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
