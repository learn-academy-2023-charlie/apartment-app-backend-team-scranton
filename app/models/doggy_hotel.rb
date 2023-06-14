class DoggyHotel < ApplicationRecord
    belongs_to :user
    validates :dog_size_grouping, :kennel, :city, :state, :square_footage, :price, :number_of_walks, presence: true
end
