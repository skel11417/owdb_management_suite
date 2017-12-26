class TaskType < ApplicationRecord
  has_many :tasks
  has_many :pods, through: :tasks

  def task_status(pod)
    tasks.where(pod_id: pod.id).first.completed
  end
end
