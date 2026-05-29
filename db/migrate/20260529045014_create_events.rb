class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
