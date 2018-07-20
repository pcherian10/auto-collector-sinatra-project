class CreateGarages < ActiveRecord::Migration[4.2]
  def change
    create_table :garages do |t|
      t.string :name
      t.integer :capacity
    end
  end
end
