class Group < ApplicationRecord

  has_many :messages

  has_many :user_groups
  has_many :users, through: :user_groups

  validates :group_name, presence: true
  accepts_nested_attributes_for :user_groups, allow_destroy: true
  
end
