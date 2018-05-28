class AddDiseaseUserToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :disease, index: true
    add_reference :questions, :user, index: true
  end
end
