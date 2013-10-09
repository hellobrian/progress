class MicroGoalsController < ApplicationController
  before_filter :get_goal, :except => :index
  before_filter :require_login

  def index
  
  end

  def show

  end

  def new
    @micro_goal = @goal.micro_goals.build
  end

  def create
    @micro_goal = MicroGoal.new(params[:micro_goal])
    @micro_goal.goal_id = @goal.id

    if @micro_goal.save 
      redirect_to goal_path(@goal), :notice => "Successfully created MicroGoals"
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def get_goal
    @goal = Goal.find(params[:goal_id])
  end
end
