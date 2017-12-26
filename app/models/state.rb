class State < ApplicationRecord
  has_many :cities
  has_many :host_orgs, through: :cities
  has_many :pods, through: :host_orgs

  def self.ranking
    select("states.name, COUNT(pods.id) as pod_count")
    .joins("LEFT JOIN cities ON states.id = cities.state_id JOIN host_orgs on host_orgs.city_id = cities.id JOIN pods on pods.host_org_id = host_orgs.id")
    .group("states.name")
    .order("pod_count DESC")
  end

end
