class MakeRatingCountDefaultZero < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:posts, :rating_count, 0)
  end
end
