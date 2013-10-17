ActiveAdmin.register Goal do
  scope "Upcoming Goal Completions",:goals_today

  index do
    column "User", :user_id do |goal|
      link_to "#{goal.user.first_name} #{goal.user.last_name}", admin_user_path(goal.user_id) 
    end
    column :verb, :sortable => :verb do |goal|
      goal.verb.capitalize
    end
    column :title do |goal|
      link_to goal.title, [:admin, goal]
    end
    column :motivation
    column :points
    column "Creation Date",:created_at, :sortable => :created_at do |goal|
      goal.completion_date.strftime("%b %e, %Y")
    end
    column "Last Updated", :updated_at, :sortable => :updated_at do |goal|
      goal.updated_at.strftime("%b %e, %Y at %l:%M %p")
    end
    default_actions
  end
end
