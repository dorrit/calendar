class CreateNote < ActiveRecord::Migration
  def change
    create_table :stickies do |t|
      t.string :note
      t.references :stickable, :polymorphic => true
      t.timestamps
    end
  end
end
