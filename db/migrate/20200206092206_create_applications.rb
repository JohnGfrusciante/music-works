class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :matter,             null: false, foreign_key: true
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
