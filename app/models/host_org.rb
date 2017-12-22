class HostOrg < ApplicationRecord
  belongs_to :city
  has_many :grantees, through: :pods
end
