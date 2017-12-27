class Task < ApplicationRecord
  belongs_to :task_type
  belongs_to :pod
  has_many :grantees, through: :pods

  # determines if task is due current week
  def due?
    due_week == Date.today.cweek ? true : false
  end

  def due_week
    due_date.cweek
  end

  def due_date
    pod.arr_date + task_type.date_offset
  end

end
