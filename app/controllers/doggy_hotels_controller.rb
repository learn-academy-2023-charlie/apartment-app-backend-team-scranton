class DoggyHotelsController < ApplicationController
    def index
        doggy_hotels = DoggyHotel.all
        render json: doggy_hotels
    end
    
    def create
        doggy_hotel = DoggyHotel.create(doggy_hotel_params)
        if doggy_hotel.valid?
            render json: doggy_hotel
        else
            render json: doggy_hotel.errors, status: 422
        end
    end

    def update
        doggy_hotel = DoggyHotel.find(params[:id])
        doggy_hotel.update(doggy_hotel_params)
        if doggy_hotel.valid?
            render json: doggy_hotel
        else
            render json: doggy_hotel.errors, status: 422
        end
    end
    
    private
    def doggy_hotel_params
        params.require(:doggy_hotel).permit(:dog_size_grouping, :kennel, :city, :state, :square_footage, :price, :number_of_walks, :image, :user_id
        )
    end
end
