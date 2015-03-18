class CreateBikeRecords < ActiveRecord::Migration
  def change
    create_table :bike_records do |t|
    	t.integer :duration
    	t.decimal :distance

      t.timestamps null: false
    end
  end
end
