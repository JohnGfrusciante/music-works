class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :user,             null: false, foreign_key: true
      t.references :matter_category,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
