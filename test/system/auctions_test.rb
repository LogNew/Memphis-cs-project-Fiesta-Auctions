require "application_system_test_case"

class AuctionsTest < ApplicationSystemTestCase
  setup do
    @auction = auctions(:one)
  end

  test "visiting the index" do
    visit auctions_url
    assert_selector "h1", text: "Auctions"
  end

  test "creating a Auction" do
    visit auctions_url
    click_on "New Auction"

    fill_in "Auction end time", with: @auction.auction_end_time
    fill_in "Auction start time", with: @auction.auction_start_time
    fill_in "Category", with: @auction.category
    fill_in "Current price", with: @auction.current_price
    fill_in "Description", with: @auction.description
    fill_in "Highest bid", with: @auction.highest_bid
    fill_in "Highest bidder", with: @auction.highest_bidder
    fill_in "Name", with: @auction.name
    fill_in "Seller", with: @auction.seller
    click_on "Create Auction"

    assert_text "Auction was successfully created"
    click_on "Back"
  end

  test "updating a Auction" do
    visit auctions_url
    click_on "Edit", match: :first

    fill_in "Auction end time", with: @auction.auction_end_time
    fill_in "Auction start time", with: @auction.auction_start_time
    fill_in "Category", with: @auction.category
    fill_in "Current price", with: @auction.current_price
    fill_in "Description", with: @auction.description
    fill_in "Highest bid", with: @auction.highest_bid
    fill_in "Highest bidder", with: @auction.highest_bidder
    fill_in "Name", with: @auction.name
    fill_in "Seller", with: @auction.seller
    click_on "Update Auction"

    assert_text "Auction was successfully updated"
    click_on "Back"
  end

  test "destroying a Auction" do
    visit auctions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Auction was successfully destroyed"
  end
end
