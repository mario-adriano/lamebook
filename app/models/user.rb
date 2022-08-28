class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable,
         :validatable
  
  has_many :posts, dependent: :destroy
  has_many :likes

  validates :username, presence: :true
end
