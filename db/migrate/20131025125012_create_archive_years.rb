class CreateArchiveYears < ActiveRecord::Migration
  def change
    create_table :archive_years do |t|
      t.integer :year
      t.integer :user_id
      t.boolean :archive

      t.timestamps
    end
  end
end
