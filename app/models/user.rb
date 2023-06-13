class User < ApplicationRecord
  has_many :doggyhotels
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        
end
