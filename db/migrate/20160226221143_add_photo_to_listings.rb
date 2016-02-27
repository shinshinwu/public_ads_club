class AddPhotoToListings < ActiveRecord::Migration
  def up
    add_attachment :listings, :photo
  end

  def down
    remove_attachment :listings, :photo
  end
end