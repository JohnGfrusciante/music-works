class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :user,             null: false, foreign_key: true
      t.references :matter,             null: false, foreign_key: true
      t.integer :status,                 null: false, default: "0"
      t.timestamps
    end
  end
end
