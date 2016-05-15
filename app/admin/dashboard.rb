ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

        column do
            panel "Jobs" do
                table_for Job.all do |t|
                  t.column("Título") { |obj| link_to obj.title_en, admin_job_path(obj) }
                  t.column("URL") { |obj| obj.video_url }
                  t.column("Privado") { |obj| obj.password.blank? ? "Não" : "Sim" }
                end
            end
        end

        column do
            panel "Equipe" do
                table_for Employee.all do |t|
                  t.column("Nome") { |obj| link_to obj.name, admin_empregado_path(obj) }
                  t.column("Cargo") { |obj| obj.role_pt }
                end
            end
        end

        # column do
        #     panel "Info" do
        #       para "Welcome to ActiveAdmin."
        #     end
        # end
    end

    # section "Tasks that are late" do
        # table_for current_admin_user.tasks.where('due_date < ?', Time.now) do |t|
        #   t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
        #   t.column("Title") { |task| link_to task.title, admin_task_path(task) }
        #   t.column("Assigned To") { |task| task.admin_user.email }
        #   t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
        # end
    # end

    # columns do
      # column do
      #   panel "Equipe" do
      #     ul do
      #       Employee.all.map do |employee|
      #         li link_to(employee.name, admin_empregado_path(employee))
      #       end
      #     end
      #   end
      # end

      # column do
      #   panel "Info" do
      #     para "Welcome to ActiveAdmin."
      #   end
      # end
    # end
  end # content
end
