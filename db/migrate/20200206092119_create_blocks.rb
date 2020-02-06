class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.references :musician,             null: false, foreign_key: true
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
