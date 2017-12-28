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

  def self.for_year(year)
    start_date = Date.new(year)
    end_date = start_date.end_of_year
    TravelDate.where(:date => start_date..end_date).order(:date)
  end

  def self.first_year
    TravelDate.order(:date).first.
    date.year.to_i
  end

  def self.last_year
    TravelDate.order(:date).last.
    date.year.to_i
  end
end
