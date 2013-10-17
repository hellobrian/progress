ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    section "Top 10 Achievers" do
        table_for User.order("points desc").limit(10) do
            column :id do |user|
                link_to user.id, admin_user_path(user)
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
