class CreateCagos < ActiveRecord::Migration
  def change
    create_table :cagos do |t|
      t.string :name
      t.integer :status_id

      t.timestamps
    end
  end
end
