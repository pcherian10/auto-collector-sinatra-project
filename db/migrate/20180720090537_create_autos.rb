class CreateAutos < ActiveRecord::Migration[4.2]
  def change
    create_table :autos do |t|
      t.string :name
      t.string :manufacturer
    end
  end
end
