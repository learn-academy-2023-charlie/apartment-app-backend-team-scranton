require 'rails_helper'

RSpec.describe "DoggyHotels", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  # validates get index 
  describe "GET /index" do
    it 'gets a list of doggy hotels' do
      doggy_hotel = user.doggy_hotels.create(
        dog_size_grouping: 'small',
        kennel: '1',
        city: 'here',
        state: 'HE',
        square_footage: 5,
        price: '5',
        number_of_walks: 5,
        image: 'image.com',
      )
      get '/doggy_hotels'

      doggy_hotel = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(doggy_hotel.first['dog_size_grouping']).to eq('small')
    end
  end

  # validates that a doggy hotel can be created with valid attributes
  describe "POST /create" do
    it "creates a new doggy hotel" do
      doggy_hotel_params = {
        doggy_hotel: {
          dog_size_grouping: 'small',
          kennel: '1',
          city: 'here',
          state: 'HE',
          square_footage: 5,
          price: '5',
          number_of_walks: 5,
          image: 'image.com',
          user_id: user.id
        }
      }
      post '/doggy_hotels', params: doggy_hotel_params

      json = JSON.parse(response.body)
      expect(json['dog_size_grouping']).to eq 'small'
      expect(json['kennel']).to eq '1'
      expect(json['city']).to eq 'here'
      expect(json['state']).to eq 'HE'
      expect(json['square_footage']).to eq 5
      expect(json['price']).to eq '5'
      expect(json['number_of_walks']).to eq 5
    end

    #below statements each validate an attribute of doggy hotel for create functionality
    it 'is not valid without a dog_size_grouping' do
      doggy_hotel_params = {
        doggy_hotel: {
          kennel: '1',
          city: 'here',
          state: 'HE',
          square_footage: 5,
          price: '5',
          number_of_walks: 5,
          image: 'image.com',
          user_id: user.id
        }
      }
      post '/doggy_hotels', params: doggy_hotel_params
      error_response = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(error_response['dog_size_grouping']).to include "can't be blank"
    end

    it 'is not valid without a kennel' do
      doggy_hotel_params = {
        doggy_hotel: {
          dog_size_grouping: 'small',
          city: 'here',
          state: 'HE',
          square_footage: 5,
          price: '5',
          number_of_walks: 5,
          image: 'image.com',
          user_id: user.id
        }
      }
      post '/doggy_hotels', params: doggy_hotel_params
      error_response = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(error_response['kennel']).to include "can't be blank"
    end

    it 'is not valid without a city' do
      doggy_hotel_params = {
        doggy_hotel: {
          dog_size_grouping: 'small',
          kennel: '1',
          state: 'HE',
          square_footage: 5,
          price: '5',
          number_of_walks: 5,
          image: 'image.com',
          user_id: user.id
        }
      }
      #request
      post '/doggy_hotels', params: doggy_hotel_params
      error_response = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(error_response['city']).to include "can't be blank"
    end

    it 'is not valid without a state' do
      doggy_hotel_params = {
        doggy_hotel: {
          dog_size_grouping: 'small',
          kennel: '1',
          city: 'here',
          square_footage: 5,
          price: '5',
          number_of_walks: 5,
          image: 'image.com',
          user_id: user.id
        }
      }
      post '/doggy_hotels', params: doggy_hotel_params
      error_response = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(error_response['state']).to include "can't be blank"
    end

    it 'is not valid without a square_footage' do
      doggy_hotel_params = {
        doggy_hotel: {
          dog_size_grouping: 'small',
          kennel: '1',
          city: 'here',
          state: 'HE',
          price: '5',
          number_of_walks: 5,
          image: 'image.com',
          user_id: user.id
        }
      }
      post '/doggy_hotels', params: doggy_hotel_params
      error_response = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(error_response['square_footage']).to include "can't be blank"
    end

    it 'is not valid without a price' do
      doggy_hotel_params = {
        doggy_hotel: {
          dog_size_grouping: 'small',
          kennel: '1',
          city: 'here',
          state: 'HE',
          square_footage: 5,
          number_of_walks: 5,
          image: 'image.com',
          user_id: user.id
        }
      }
      post '/doggy_hotels', params: doggy_hotel_params
      error_response = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(error_response['price']).to include "can't be blank"
    end

    it 'is not valid without a number_of_walks' do
      doggy_hotel_params = {
        doggy_hotel: {
          dog_size_grouping: 'small',
          kennel: '1',
          city: 'here',
          state: 'HE',
          square_footage: 5,
          price: '5',
          image: 'image.com',
          user_id: user.id
        }
      }
      post '/doggy_hotels', params: doggy_hotel_params
      error_response = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(error_response['number_of_walks']).to include "can't be blank"
    end
  end

end