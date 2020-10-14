class AddPointsColumnToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :points, :integer
  end
end
