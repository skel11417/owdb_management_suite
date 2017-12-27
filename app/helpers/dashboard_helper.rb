module DashboardHelper
  def current_tasks
    task_types = TaskType.all.includes(:pods, :tasks)
    link_to 'hey', '#'
  end
end
