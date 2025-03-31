class RenameResetSendAtColumnToResetSentAt < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :reset_send_at, :reset_sent_at
  end
end
