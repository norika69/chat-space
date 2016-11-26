class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups
  #一対多の時 currentuserがグループ作成した時（管理側）
  # has_many :groups, through: :user_group
  #多対多の時 中間テーブルにidを保存するため（参加者側）
  has_many :user_group
  has_many :messages
  validates :email, presence: true
end
