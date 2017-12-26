class Task < ApplicationRecord
  belongs_to :task_type
  belongs_to :pod
  has_many :grantees, through: :pods
end
