class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable,
				 :trackable, authentication_keys: [:login]
  
  validates :login, presence: :true, uniqueness: { case_sensitive: false }
end
