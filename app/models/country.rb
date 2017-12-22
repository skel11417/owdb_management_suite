class Country < ApplicationRecord
  has_many :pods

  def get_img_url
    "#{id}.ico"
  end

end
