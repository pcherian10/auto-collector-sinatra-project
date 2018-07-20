class AddGarageIdToAutos < ActiveRecord::Migration[4.2]
  def change
    add_column :autos, :garage_id, :integer
  end
end
