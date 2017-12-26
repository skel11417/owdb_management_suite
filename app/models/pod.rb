class Pod < ApplicationRecord
  belongs_to :grantee
  belongs_to :country
  belongs_to :travel_date
  belongs_to :host_org
  has_one :city, through: :host_org
  has_one :state, through: :city
  has_many :tasks
  has_many :task_types, through: :tasks


  def self.by_month(m)
    month = Date.new(2018,m,1)
    where(:arr_date => month..month.end_of_month)
  end

  def confirmed?
    confirmed ? "Confirmed" : "Pending"
  end

end
