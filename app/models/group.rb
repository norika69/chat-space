class Group < ApplicationRecord
  has_many :users, through: :user_groups
  has_many :messages
  has_many :user_groups
  validates :group_name, presence: true
  belongs_to :user

  accepts_nested_attributes_for :user_groups
  
end
