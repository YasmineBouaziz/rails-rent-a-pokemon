require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get pokemons_index_url
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end
end
