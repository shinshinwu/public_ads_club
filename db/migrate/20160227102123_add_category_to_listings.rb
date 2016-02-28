class AddCategoryToListings < ActiveRecord::Migration
  def up
    add_column :listings, :category, :string, after: :min_lease_days
  end

  def down
    remove_attachment :listings, :category, :string
  end
end