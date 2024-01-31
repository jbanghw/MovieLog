class CreateMovieRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_records do |t|
      t.string :movie_id
      t.boolean :watched
      t.date :watched_date
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
