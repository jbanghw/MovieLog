class AddFieldsToMovieRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :movie_records, :poster, :string
  end
end
