class AddDiseaseUserToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :user, index: true
  end
end
