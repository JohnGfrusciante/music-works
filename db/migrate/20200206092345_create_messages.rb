class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content,               null: false
      t.references :user,             null: false, foreign_key: true
      t.references :musician,             null: false, foreign_key: true
      t.references :chat,             null: false, foreign_key: true
      t.integer :status,                 null: false, default: "0"
      t.timestamps
    end
  end
end
