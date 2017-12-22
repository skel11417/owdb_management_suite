class Pod < ApplicationRecord
  belongs_to :grantee
  belongs_to :country
  belongs_to :travel_date
  belongs_to :host_org

  def confirmed?
    confirmed ? "Confirmed" : "Unconfirmed"
  end
end
