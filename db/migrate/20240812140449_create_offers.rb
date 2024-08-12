class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.string :localisation
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
