class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :cago_id
      t.integer :status_id
      t.integer :prior_status_id

      t.timestamps
    end
  end
end
