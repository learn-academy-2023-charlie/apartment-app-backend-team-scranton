user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")
user3 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")
user4 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

pug_life = [
    {
        dog_size_grouping: "small"
        kennel: "1"
        city: "East Harlem"
        state: "NY"
        square_footage: "100"
        price: "25"
        number_of_walks: 1
        image: "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/fl28015324167-public-image.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=44cc714e4a1d4d16370334dad6f8d416"
    }
   
]

barks_and_recreation = [
    {
        dog_size_grouping: "medium"
        kennel: "2"
        city: "Pawnee"
        state: "IN"
        square_footage: "200"
        price: "40"
        number_of_walks: 2
        image: "https://cdn.shopify.com/s/files/1/0504/3693/1753/files/Barks-kennel-3.jpg?v=1635228642"
    }
   
]

barking_bad = [
    {
        dog_size_grouping: "large"
        kennel: "3"
        city: "Albuquerque"
        state: "NM"
        square_footage: "300"
        price: "50"
        number_of_walks: 3
        image:
    }
   
]

barkingham_palace = [
    {
        dog_size_grouping: "any"
        kennel: "4"
        city: "London"
        state: "UK"
        square_footage: "828000"
        price: "1500"
        number_of_walks: 10
        image: "https://images.unsplash.com/photo-1616499199044-7d1e6da556dd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3BvaWxlZCUyMGRvZ3N8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60"
    }
   
]

pug_life.each do |doggyhotel|
  user1.doggyhotels.create(doggyhotel)
  p "creating: #{doggyhotel}"
end

barks_and_recreation.each do |doggyhotel|
  user2.doggyhotels.create(doggyhotel)
  p "creating: #{doggyhotel}"
end

barking_bad.each do |doggyhotel|
  user3.doggyhotels.create(doggyhotel)
  p "creating: #{doggyhotel}"
end

barkingham_palace.each do |doggyhotel|
  user4.doggyhotels.create(doggyhotel)
  p "creating: #{doggyhotel}"
end
