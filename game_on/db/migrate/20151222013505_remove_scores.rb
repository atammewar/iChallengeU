class RemoveScores < ActiveRecord::Migration
  def up
	remove_column :exercises, :score
  end

  def down
	add_column :exercises, :score, :decimal, :precision => 12, :scale => 7
  end
end
