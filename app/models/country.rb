class Country < ApplicationRecord
  has_many :pods
  has_many :host_orgs, through: :pods
  has_many :grantees, through: :pods
  has_many :cities, through: :pods

  def get_img_url
    "#{id}.ico"
  end

  def self.refined_country_list
    owlc = joins(:pods).group('countries.id')
    the_rest = joins(:pods).group('countries.id')
  end
end
