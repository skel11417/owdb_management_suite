class Pod < ApplicationRecord
  belongs_to :grantee
  belongs_to :country
  belongs_to :travel_date
  belongs_to :host_org
  has_one :city, through: :host_org
  has_one :state, through: :city

  def confirmed?
    confirmed ? "Confirmed" : "Pending"
  end

end
