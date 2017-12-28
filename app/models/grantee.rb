class Grantee < ApplicationRecord
  has_many :pods
  has_many :host_orgs, through: :pods
  has_many :countries, through: :pods

  def self.ranking
    select("grantees.id, grantees.name, COUNT(pods.id) as pod_count")
    .joins("join pods on pods.grantee_id = grantees.id")
    .group("grantees.name")
    .order("pod_count DESC")
  end
end
