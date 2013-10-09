class MicroGoalsController < ApplicationController
  before_filter :get_goal, :except => :index
  before_filter :require_login

  def index
  
  end

  def show

  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def get_goal
    @goal = current_user.goals.last
  end
end
