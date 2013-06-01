class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :name
      t.integer :ostatus_id
      t.integer :nstatus_id

      t.timestamps
    end
  end
end
