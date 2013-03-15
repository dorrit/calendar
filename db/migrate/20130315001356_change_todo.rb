class ChangeTodo < ActiveRecord::Migration
  def change
    change_table :to_dos do |t|
      t.rename :task, :name
    end
  end
end
