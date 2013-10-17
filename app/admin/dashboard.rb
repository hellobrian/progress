ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    
    section "User Growth for last 7 days" do
        table_for User.where(:created_at => ((Date.today-7)..Date.today)) do
            column :id do |user|
                link_to user.id, [:admin, user]
            end
            column :first_name
            column :last_name
            column :gender, :sortable => :gender do |user|
                user.gender.capitalize
            end
            column "Date Created",:created_at do |user|
                user.created_at.strftime("%b %e, %Y at %l:%M %p")
            end
        end
        
    end 

    section "Top 10 Achievers" do
        table_for User.order("points desc").limit(10) do
            column :id do |user|
                link_to user.id, [:admin, user]
            end
            column :first_name
            column :last_name
            column :gender do |user|
                user.gender.capitalize
            end
            column :points
            column :status
        end
        strong { link_to "All Users", admin_users_path }
    end

    #Here is an example of a simple dashboard with columns and panels.
    
  #   columns do
  #     column do
  #       panel "Recent Posts" do
  #         ul do
  #           Post.recent(5).map do |post|
  #             li link_to(post.title, admin_post_path(post))
  #           end
  #         end
  #       end
  #     end

  #     column do
  #       panel "Info" do
  #         para "Welcome to ActiveAdmin."
  #       end
  #     end
  #   end
  end # content
end
