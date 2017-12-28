class TaskType < ApplicationRecord
  validates :name, presence: true, length: { in: 6..64 }
  validates :date_offset, numericality: { only_integer: true }
  validates_associated :tasks
  has_many :tasks, dependent: :destroy
  has_many :pods, through: :tasks

# designed for checklist logic
  def task_status(pod)
    find_task(pod).completed
  end

  def timeframe

  end

  def pre?
    date_offset < 0
  end

  def post?
    date_offset > 0
  end

  def days_to_weeks
    if date_offset
      date_offset > 0 ? (date_offset - 10) / 7 : date_offset / -7
    else
      0
    end
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
