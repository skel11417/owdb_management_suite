class TravelDate < ApplicationRecord
  validates :date, presence: true
  has_many :pods, dependent: :destroy

  def full_date
    date.strftime("%B %-d, %Y")
  end

  def same_dates?
    dates = []
    pods.each do |pod|
      dates << pod.arr_date
    end
    dates.all? {|x| x == dates[0]}
  end
end
