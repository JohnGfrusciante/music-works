class CreateMatterCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :matter_categories do |t|

      t.timestamps
    end
  end
end
