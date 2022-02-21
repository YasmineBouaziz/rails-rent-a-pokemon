class AddUserForeignKeyToPokemon < ActiveRecord::Migration[6.1]
  def change
    add_reference :pokemons, :user, foreign_key: true
  end
end
