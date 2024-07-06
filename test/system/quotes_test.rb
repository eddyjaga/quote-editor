require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  setup do
    @quote = quotes(:first)
  end

  test "showing a quote" do
    visit quotes_url

    click_link @quote.name
    assert_selector "h1", text: @quote.name
  end

  test "updating a quote" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit Quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "destroying a quote" do
    visit quotes_url
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end

  test "visiting the index" do
    visit quotes_url
  
    assert_selector "h1", text: "Quotes"

    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    fill_in "Name", with: "Capybara quote"
    click_on "Create Quote"

    asset_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end
end
