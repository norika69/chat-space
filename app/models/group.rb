class Group < ApplicationRecord
  has_many :users
  has_many :messages

  validates :group_name, presence: true

  # def add_error_sample
  #   if group_name.empty?
  #     errors.add(:group_name, "に関係するエラーを追加")
  #     errors[:group] << "モデル全体に関係するエラーを追加"
  #   end
  # end
end
