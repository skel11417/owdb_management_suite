class HostOrg < ApplicationRecord
  belongs_to :city
  has_many :grantees, through: :pods
  has_many :pods

  def city_state
    if city.id == 38148
      "TBD"
    else
      "#{city.name}, #{city.state.abbr}"
    end
  end
end
