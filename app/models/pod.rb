class Pod < ApplicationRecord
  belongs_to :grantee
  belongs_to :country
  belongs_to :travel_date
end
