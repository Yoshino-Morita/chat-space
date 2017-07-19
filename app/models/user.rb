class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :members
  has_many :messages
  has_many :groups, through: :members
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name,:email, presence: true,on: :update

  scope :name_search,->(current_user,keyword){ where('name LIKE(?)',"%#{keyword}%").where.not( id: current_user )}
end
