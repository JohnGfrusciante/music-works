class CreateMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :musicians do |t|
      t.string :image
      t.string :name,               null: false
      t.text :biography,               null: false
      t.text :activity_history,               null: false
      t.text :activity_place,               null: false
      t.string :email,               null: false
      t.text :homepage
      t.text :youtube
      t.text :spotify
      t.text :apple_music
      t.text :twitter
      t.text :facebook
      t.string :otherlink_title
      t.text :otherlink_url
      t.text :live_info
      t.string :office
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
