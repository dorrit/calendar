class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :taggable_tags do |t|
      t.column :tag_id, :integer
      t.column :taggable_id, :integer
      t.column :taggable_type, :string

      t.timestamps
    end
  end
end
