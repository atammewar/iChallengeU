class CreateWeightRecords < ActiveRecord::Migration
  def change
    create_table :weight_records do |t|
    	t.integer :duration

      t.timestamps null: false
    end
  end
end
