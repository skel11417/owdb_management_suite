class City < ApplicationRecord
  has_many :host_orgs
  belongs_to :state
end
