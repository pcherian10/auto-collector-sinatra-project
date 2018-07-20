class AddUserIdToGarage < ActiveRecord::Migration[4.2]
  def change
    add_column :garages, :user_id, :integer
  end
end
