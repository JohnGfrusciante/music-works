class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.references :matter,             null: false, foreign_key: true
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
