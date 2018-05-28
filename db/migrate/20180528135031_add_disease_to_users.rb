class AddDiseaseToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :disease, index: true
  end
end
