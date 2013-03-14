class CreateCalendar < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.column :date_time, :datetime
      t.column :event, :string
      t.timestamps
    end
  end
end
