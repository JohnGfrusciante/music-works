class CreateMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :musicians do |t|
      t.text :image
      t.string :name,               null: false
      t.text :biography,               null: false
      t.text :activity_history,               null: false
      t.text :activity_place,               null: false
      t.string :email,               null: false
      t.text :sound_source
      t.text :homepage
      t.text :twitter
      t.text :facebook
      t.text :other_link
      t.text :live_info
      t.string :office
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
