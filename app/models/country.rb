class Country < ApplicationRecord
  has_many :pods
  has_many :host_orgs, through: :pods
  has_many :grantees, through: :pods
  has_many :cities, through: :pods

  def get_img_url
    "#{id}.ico"
  end

end
