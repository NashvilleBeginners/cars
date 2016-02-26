class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :model, index: true, foreign_key: true
      t.references :color, index: true, foreign_key: true
      t.integer :number_of_doors
      t.integer :year
      t.integer :number_of_seats

      t.timestamps null: false
    end
  end
end
