class User < ApplicationRecord
  has_many :doggy_hotels
  devise  :database_authenticatable, :registerable,
          :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
      
end
