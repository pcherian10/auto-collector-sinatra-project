class AddGarageIdToAutos < ActiveRecord::Migration
  def change
    add_column :autos, :garage_id, :integer
  end
end
