class ProofsController < ApplicationController
  before_filter :get_microgoal, :except => :index
  before_filter :require_login

  def new
    @proof = Proof.new
  end

  def create
  end

  private

  def get_microgoal
    @micro_goal = MicroGoal.find(params[:micro_goal_id])
  end
end
