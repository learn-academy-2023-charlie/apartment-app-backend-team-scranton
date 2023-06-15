class AddColumnToDoggyHotels < ActiveRecord::Migration[7.0]
  def change
    add_column :doggy_hotels, :name, :string
  end
end
  