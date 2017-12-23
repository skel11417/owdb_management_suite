class Grantee < ApplicationRecord
  has_many :pods
  has_many :host_orgs, through: :pods

  def self.ranking
    select("grantees.name, COUNT(pods.id) as pod_count")
    .joins("join pods on pods.grantee_id = grantees.id")
    .group("grantees.name")
    .order("pod_count DESC")
  end
end
