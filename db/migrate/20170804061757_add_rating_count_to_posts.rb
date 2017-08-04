class AddRatingCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column(:posts,:rating_count,:integer)
  end
end
