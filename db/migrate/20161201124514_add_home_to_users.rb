class AddHomeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :home, foreign_key: true
  end
end
