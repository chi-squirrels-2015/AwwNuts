module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def member_for
    start_time = DateTime.now
    end_time = current_user.created_at
    distance_of_time_in_words(start_time, end_time)
  end

  def last_edited(question)
    start_time = DateTime.now
    end_time = question.updated_at
    distance_of_time_in_words(start_time, end_time)
  end

  # def activity_stream(user)
  #   activities = []
  #   Question.find(user).order_by(created_at)
  #   Answer.find(user).order_by(created_at)
  #   Comment.find(user).order_by(created_at)
  # end

  def question_activity(id)
    question = Question.find(id)
    start_time = DateTime.now
    end_time = question.created_at
    distance_of_time_in_words(start_time, end_time)
  end

end