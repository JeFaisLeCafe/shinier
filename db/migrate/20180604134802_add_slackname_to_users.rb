class AddSlacknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slackname, :string
  end
end
