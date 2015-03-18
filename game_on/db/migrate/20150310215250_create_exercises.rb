class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :user
      t.actable
      t.integer :score

      t.timestamps null: false
    end
  end
end
