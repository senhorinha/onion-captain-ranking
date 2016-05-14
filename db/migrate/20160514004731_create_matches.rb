class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :player
      t.integer :points

      t.timestamps null: false
    end
  end
end
