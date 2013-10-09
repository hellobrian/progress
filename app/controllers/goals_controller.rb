class GoalsController < ApplicationController
  before_filter :require_login, :except => :index

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(params[:goal])
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_path(@goal), :notice => "Goal Created, Add some micogoals."
    else
      render :new
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
