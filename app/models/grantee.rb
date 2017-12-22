class Grantee < ApplicationRecord
  has_many :pods
  has_many :host_orgs, through: :pods
end
