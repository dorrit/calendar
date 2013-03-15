class RenameStickyColumn < ActiveRecord::Migration
  def change
    change_table :stickies do |t|
      t.rename :note, :name
    end
  end
end
