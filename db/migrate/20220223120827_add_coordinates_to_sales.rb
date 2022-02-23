class AddCoordinatesToSales < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :latitude, :float
    add_column :sales, :longitude, :float
  end
end
