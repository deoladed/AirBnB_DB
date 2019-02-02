class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.references :day
      t.references :reservation

      t.timestamps
    end
  end
end
