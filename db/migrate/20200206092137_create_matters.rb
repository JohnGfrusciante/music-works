class CreateMatters < ActiveRecord::Migration[5.2]
  def change
    create_table :matters do |t|
      t.string :title,                 null: false
      t.integer :reward,                 null: false
      t.date :deadline,                 null: false
      t.date :start
      t.date :end,                 null: false
      t.text :content,                 null: false
      t.string :payment
      t.text :supplement
      t.integer :status,                 null: false, default: "0"
      t.references :musician,             null: false, foreign_key: true
      t.references :matter_category,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
