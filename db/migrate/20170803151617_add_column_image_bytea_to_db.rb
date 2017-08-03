class AddColumnImageByteaToDb < ActiveRecord::Migration[5.1]
  def change
    add_column(:posts,:actual_image,:bytea)
  end
end
