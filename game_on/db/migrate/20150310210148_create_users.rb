class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	## Account Info
    	t.string 		:name
    	t.string 		:email
    	t.boolean 	:admin, :default => false

    	## User Personal Info
    	## => Either fill out here or create new table


      t.timestamps null: false
    end
  end
end
