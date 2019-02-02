class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.integer :is_taken_by
      t.datetime :name
      
      t.timestamps
    end
  end
end
