class User < ApplicationRecord 
  # Include default devise modules. Others available are: 
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :like
  # ここまで追加
  has_many :comments
end