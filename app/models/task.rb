class Task < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_one :list
end
