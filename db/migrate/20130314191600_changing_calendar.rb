class ChangingCalendar < ActiveRecord::Migration
  def change
    change_table :calendars do |t|
      t.rename :event, :name
    end
    rename_table :calendars, :engagements
  end
end
