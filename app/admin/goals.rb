ActiveAdmin.register Goal do
  scope "Today's Goals",:goals_today

  index do
    column :user_id
    column :verb, :sortable => :verb do |goal|
      goal.verb.capitalize
    end
    column :title
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
