class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.text :number
      t.text :origin
      t.text :destination
      t.text :date
      t.text :plane
      t.integer :airplane_id

      t.timestamps
    end
  end
end
