require 'rails_helper'

RSpec.describe DoggyHotel, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  it 'validates dog_size_grouping' do
    doggy_hotel = user.doggy_hotels.create(
        kennel: '1',
        city: 'here',
        state: 'HE',
        square_footage: 5,
        price: '5',
        number_of_walks: 5,
        image: 'image.com',
    )
    expect(doggy_hotel.errors[:dog_size_grouping]).to_not be_empty
  end
  
  it 'validates kennel' do
    doggy_hotel = user.doggy_hotels.create(
        dog_size_grouping: 'small',
        city: 'here',
        state: 'HE',
        square_footage: 5,
        price: '5',
        number_of_walks: 5,
        image: 'image.com',
    )
    expect(doggy_hotel.errors[:kennel]).to_not be_empty
  end
  
  it 'validates city' do
    doggy_hotel = user.doggy_hotels.create(
        dog_size_grouping: 'small',
        kennel: '1',
        state: 'HE',
        square_footage: 5,
        price: '5',
        number_of_walks: 5,
        image: 'image.com',
    )
    expect(doggy_hotel.errors[:city]).to_not be_empty
  end
  
  it 'validates state' do
    doggy_hotel = user.doggy_hotels.create(
        dog_size_grouping: 'small',
        kennel: '1',
        city: 'here',
        square_footage: 5,
        price: '5',
        number_of_walks: 5,
        image: 'image.com',
    )
    expect(doggy_hotel.errors[:state]).to_not be_empty
  end
  
  it 'validates square_footage' do
    doggy_hotel = user.doggy_hotels.create(
        dog_size_grouping: 'small',
        kennel: '1',
        city: 'here',
        state: 'HE',
        price: '5',
        number_of_walks: 5,
        image: 'image.com',
    )
    expect(doggy_hotel.errors[:square_footage]).to_not be_empty
  end
  
  it 'validates price' do
    doggy_hotel = user.doggy_hotels.create(
        dog_size_grouping: 'small',
        kennel: '1',
        city: 'here',
        state: 'HE',
        square_footage: 5,
        number_of_walks: 5,
        image: 'image.com',
    )
    expect(doggy_hotel.errors[:price]).to_not be_empty
  end
  
  it 'validates number_of_walks' do
    doggy_hotel = user.doggy_hotels.create(
        dog_size_grouping: 'small',
        kennel: '1',
        city: 'here',
        state: 'HE',
        square_footage: 5,
        price: '5',
        image: 'image.com',
    )
    expect(doggy_hotel.errors[:number_of_walks]).to_not be_empty
  end
end
