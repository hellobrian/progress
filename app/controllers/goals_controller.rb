class GoalsController < ApplicationController
  before_filter :require_login, :except => :index

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(params[:goal])
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to user_path(current_user.id), :notice => "Goal Created."
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end


end
