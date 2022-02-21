class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.text :description
      t.text :photo_url
      t.decimal :price

      t.timestamps
    end
  end
end
