class ChangeViewsToHaveDefaultValues < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:posts, :views, 0)
    change_column_default(:posts, :rating, 0)
  end
end
