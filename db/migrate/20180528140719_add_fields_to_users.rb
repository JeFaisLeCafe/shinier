class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :secu_nb, :string
    add_column :users, :photo, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :mutuelle_nb, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :my_doctor, :string
    add_column :users, :status_in_community, :string
  end
end
