class Group < ApplicationRecord
  has_many :users
  has_many :messages

  validates :group_name, presence: true
end
