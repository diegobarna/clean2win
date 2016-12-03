class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :name, null: false
      t.integer :points, null:false, default: 1
      t.date :deadline, null:false
      t.integer :every
      t.boolean :since_done
      t.text :status, null:false
      t.text :picture
      t.text :tags, array: true, default: []
      t.boolean :validated, null: false, default: false

      t.timestamps
    end
    add_index :tasks, :tags
    add_index :tasks, :deadline
  end
end
