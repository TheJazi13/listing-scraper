require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post :create, listing: { bathroom_count: @listing.bathroom_count, bedroom_count: @listing.bedroom_count, deposit: @listing.deposit, long_description: @listing.long_description, name: @listing.name, pet_policy: @listing.pet_policy, price: @listing.price, short_description: @listing.short_description, square_feet: @listing.square_feet, website: @listing.website, year_built: @listing.year_built }
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should show listing" do
    get :show, id: @listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listing
    assert_response :success
  end

  test "should update listing" do
    patch :update, id: @listing, listing: { bathroom_count: @listing.bathroom_count, bedroom_count: @listing.bedroom_count, deposit: @listing.deposit, long_description: @listing.long_description, name: @listing.name, pet_policy: @listing.pet_policy, price: @listing.price, short_description: @listing.short_description, square_feet: @listing.square_feet, website: @listing.website, year_built: @listing.year_built }
    assert_redirected_to listing_path(assigns(:listing))
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete :destroy, id: @listing
    end

    assert_redirected_to listings_path
  end
end
