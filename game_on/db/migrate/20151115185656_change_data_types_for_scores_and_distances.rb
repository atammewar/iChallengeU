class ChangeDataTypesForScoresAndDistances < ActiveRecord::Migration
  def up
    change_column :exercises, :score, :decimal, :precision => 12, :scale => 7
    change_column :bike_records, :distance, :decimal, :precision => 12, :scale => 7
    change_column :run_records, :distance, :decimal, :precision => 12, :scale => 7
  end

  def down
    change_column :exercises, :score, :integer
    change_column :bike_records, :distance, :integer
    change_column :run_records, :distance, :integer
  end
end
