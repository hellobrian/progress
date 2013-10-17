ActiveAdmin.register User do
  index do
    column :first_name
    column :last_name
    column :email
    column :date_of_birth do |user|
      user.date_of_birth.strftime("%b %e, %Y")
    end
    column :gender do |user|
      user.gender.capitalize
    end
    column :points
    column :status
    column "Date Joined",:created_at do |user|
      user.created_at.strftime("%b %e, %Y, at %l:%M %p")
    end
    column "Last Updated",:updated_at do |user|
      user.updated_at.strftime("%b %e, %Y, at %l:%M %p")
    end
  end
end
