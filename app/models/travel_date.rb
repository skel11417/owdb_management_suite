class TravelDate < ApplicationRecord
  has_many :pods

  def full_date
    date.strftime("%B %-d, %Y")
  end

  def odd_dates?
    pods.each do |pod|
      if date != pod.arr_date
        return false
      end
    end
  end
end
