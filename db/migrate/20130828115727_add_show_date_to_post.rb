class AddShowDateToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :show_date, :datetime
  end
end
