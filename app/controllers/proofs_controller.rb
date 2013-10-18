class ProofsController < ApplicationController
  before_filter :get_microgoal, :except => :index
  before_filter :require_login

  def new
    @proof = Proof.new
  end

  def create
    @proof = Proof.new(params[:proof])
    @proof.micro_goal_id = @micro_goal.id

    if @proof.save
      redirect_to goal_path(@micro_goal.goal_id)
    else
      render :new, :alert => "Please submit an image and/or write something (click to dismiss)"
    end
  end

  private

  def get_microgoal
    @micro_goal = MicroGoal.find(params[:micro_goal_id])
  end
end
