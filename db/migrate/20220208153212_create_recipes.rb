class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.string :description
      t.boolean :public

      t.timestamps
      t.references :users, null: false, foreign_key: true
    end
  end
end
