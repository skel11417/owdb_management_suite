class TaskType < ApplicationRecord
  has_many :tasks
  has_many :pods, through: :tasks

# designed for checklist logic
  def task_status(pod)
    tasks.where(pod_id: pod.id).first.completed
  end

#
  def tasks_due?
    tasks.each do |task|
      if task.due?
        return true
      else
      end
    end
    false
  end

end
