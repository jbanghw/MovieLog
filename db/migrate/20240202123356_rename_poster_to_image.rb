class RenamePosterToImage < ActiveRecord::Migration[7.1]
  def change
    rename_column :movie_records, :poster, :image
  end
end
