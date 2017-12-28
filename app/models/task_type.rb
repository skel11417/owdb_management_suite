class TaskType < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :pods, through: :tasks

# designed for checklist logic
  def task_status(pod)
    find_task(pod).completed
  end

  def due_this_week?(pod)
    find_task(pod).due_date.cweek == Date.today.cweek
  end

  def past_due?(pod)
    unless task_status(pod)
      if find_task(pod).due_date - Date.today < 0
        true
      else
        false
      end
    end

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

  def find_task(pod)
    tasks.where(pod_id: pod.id).first
  end

end
