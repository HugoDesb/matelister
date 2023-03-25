require "test_helper"

class MatelistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matelist = matelists(:one)
  end

  test "should get index" do
    get matelists_url
    assert_response :success
  end

  test "should get new" do
    get new_matelist_url
    assert_response :success
  end

  test "should create matelist" do
    assert_difference("Matelist.count") do
      post matelists_url, params: { matelist: { name: @matelist.name } }
    end

    assert_redirected_to matelist_url(Matelist.last)
  end

  test "should show matelist" do
    get matelist_url(@matelist)
    assert_response :success
  end

  test "should get edit" do
    get edit_matelist_url(@matelist)
    assert_response :success
  end

  test "should update matelist" do
    patch matelist_url(@matelist), params: { matelist: { name: @matelist.name } }
    assert_redirected_to matelist_url(@matelist)
  end

  test "should destroy matelist" do
    assert_difference("Matelist.count", -1) do
      delete matelist_url(@matelist)
    end

    assert_redirected_to matelists_url
  end
end
