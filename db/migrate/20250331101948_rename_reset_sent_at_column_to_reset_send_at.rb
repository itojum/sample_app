class RenameResetSentAtColumnToResetSendAt < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :reset_sent_at, :reset_send_at
  end
end
