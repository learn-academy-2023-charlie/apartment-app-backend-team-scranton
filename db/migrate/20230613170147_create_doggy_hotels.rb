class CreateDoggyHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :doggy_hotels do |t|
      t.string :dog_size_grouping
      t.string :kennel
      t.string :city
      t.string :state
      t.integer :square_footage
      t.string :price
      t.integer :number_of_walks
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
