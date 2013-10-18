class GoalsController < ApplicationController
  before_filter :require_login, :except => :index

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(params[:goal])
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to user_path(@goal.user_id), :notice => "Goal Created, Add some micogoals."
    else
      render :new, :notice => "Please fill in all the required fields"
    end
  end

  def edit
  end

  def update
  end

  def index
    @goals = User.find(current_user.id).goals
  end

  def show
    @goal = Goal.find(params[:id])
    @micro_goals = @goal.micro_goals.sort_by &:completion_date
  end

  def destroy
  end


end
