class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.references :user,             null: false, foreign_key: true
      t.references :skill,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
