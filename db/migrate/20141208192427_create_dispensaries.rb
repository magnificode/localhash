class CreateDispensaries < ActiveRecord::Migration
  def change
    create_table :dispensaries do |t|
      t.string :name
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
