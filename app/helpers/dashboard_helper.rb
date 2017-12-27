module DashboardHelper
  def current_tasks
    task_types = TaskType.all.includes(:pods, :tasks)
    link_to 'hey', '#'
  end

  def update_task_url(task)
    '/dashboard/tasks/' + task.id.to_s
  end
end
