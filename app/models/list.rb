class List < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_many :tasks, dependent: :destroy
end
