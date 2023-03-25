require "application_system_test_case"

class MatelistsTest < ApplicationSystemTestCase
  setup do
    @matelist = matelists(:one)
  end

  test "visiting the index" do
    visit matelists_url
    assert_selector "h1", text: "Matelists"
  end

  test "should create matelist" do
    visit matelists_url
    click_on "New matelist"

    fill_in "Name", with: @matelist.name
    click_on "Create Matelist"

    assert_text "Matelist was successfully created"
    click_on "Back"
  end

  test "should update Matelist" do
    visit matelist_url(@matelist)
    click_on "Edit this matelist", match: :first

    fill_in "Name", with: @matelist.name
    click_on "Update Matelist"

    assert_text "Matelist was successfully updated"
    click_on "Back"
  end

  test "should destroy Matelist" do
    visit matelist_url(@matelist)
    click_on "Destroy this matelist", match: :first

    assert_text "Matelist was successfully destroyed"
  end
end
