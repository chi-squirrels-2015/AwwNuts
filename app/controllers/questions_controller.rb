class QuestionsController < ApplicationController

  def index
    if !params[:search]
      @questions = Question.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    else
      search = Question.search do
        fulltext params[:search]
      end
      @questions = search.results
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question)
      flash[:success] = "Question Successfully Created!"
    else
      @error = @question.errors
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.sort { |a,b| b.vote_count <=> a.vote_count }
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

  def upvote
    if logged_in?
      question = Question.find(params[:question_id])
      vote = Vote.find_or_initialize_by(votable: question, voter: current_user)
      vote.up
      vote.save
      render json: { vote_count: question.vote_count }
    end
  end

  def downvote
    if logged_in?
      question = Question.find(params[:question_id])
      vote = Vote.find_or_initialize_by(votable: question, voter: current_user)
      vote.down
      vote.save
      render json: { vote_count: question.vote_count }
    end
  end

  def temp
    @question = Question.new(content: params[:content])
    # render json: @question, locals: {question: @question}
    render :_temp_question, locals: {question: @question}, layout: false
  end

  private

  def question_params
    params.require(:question).permit(:title, :content).merge(author_id: current_user.id)
  end
end
