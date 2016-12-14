class ChangePictureAndTagColumnsInTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :picture, :room
    add_column :tasks, :room, :text, null: false, default: 'living room'
    remove_column :tasks, :tags
    add_column :tasks, :action, :text, null: false, default: 'clean'
  end
end
