class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :name
      t.string :manufacturer
    end
  end
end
