require "application_system_test_case"

class AirplanesTest < ApplicationSystemTestCase
  setup do
    @airplane = airplanes(:one)
  end

  test "visiting the index" do
    visit airplanes_url
    assert_selector "h1", text: "Airplanes"
  end

  test "creating a Airplane" do
    visit airplanes_url
    click_on "New Airplane"

    fill_in "Columns", with: @airplane.columns
    fill_in "Name", with: @airplane.name
    fill_in "Rows", with: @airplane.rows
    click_on "Create Airplane"

    assert_text "Airplane was successfully created"
    click_on "Back"
  end

  test "updating a Airplane" do
    visit airplanes_url
    click_on "Edit", match: :first

    fill_in "Columns", with: @airplane.columns
    fill_in "Name", with: @airplane.name
    fill_in "Rows", with: @airplane.rows
    click_on "Update Airplane"

    assert_text "Airplane was successfully updated"
    click_on "Back"
  end

  test "destroying a Airplane" do
    visit airplanes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Airplane was successfully destroyed"
  end
end
