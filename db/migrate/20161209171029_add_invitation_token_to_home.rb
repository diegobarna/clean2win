class AddInvitationTokenToHome < ActiveRecord::Migration[5.0]
  def change
    add_column :homes, :invitation_token, :string
    add_index :homes, :invitation_token, unique: true
  end
end
