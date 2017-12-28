class Pod < ApplicationRecord
  belongs_to :grantee
  belongs_to :country
  belongs_to :travel_date
  belongs_to :host_org
  has_one :city, through: :host_org
  has_one :state, through: :city
  has_many :tasks
  has_many :task_types, through: :tasks

  def full_arr_date
    arr_date.strftime("%B %-d, %Y")
  end

  def short_date
    arr_date.strftime("%m-%d")
  end

  def task_status(task_type)
    where(task_type_id: task_type.id).first.completed
  end

  def self.for_month(m)
    month = Date.new(2018,m,1)
    TravelDate.where(:date => start_date..end_date).order(:date)
    where(:arr_date => month..month.end_of_month)
  end

  def self.for_month_year(m, y)
    month = Date.new(y,m,1)
    where(:arr_date => month..month.end_of_month)

  end

  def confirmed?
    confirmed ? "Confirmed" : "Pending"
  end

end
