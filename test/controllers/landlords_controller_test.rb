require 'test_helper'

class LandlordsControllerTest < ActionController::TestCase
  setup do
    @landlord = landlords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:landlords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create landlord" do
    assert_difference('Landlord.count') do
      post :create, landlord: { address: @landlord.address, city: @landlord.city, company_id: @landlord.company_id, country: @landlord.country, name: @landlord.name, postal_code: @landlord.postal_code, state: @landlord.state, website: @landlord.website }
    end

    assert_redirected_to landlord_path(assigns(:landlord))
  end

  test "should show landlord" do
    get :show, id: @landlord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @landlord
    assert_response :success
  end

  test "should update landlord" do
    patch :update, id: @landlord, landlord: { address: @landlord.address, city: @landlord.city, company_id: @landlord.company_id, country: @landlord.country, name: @landlord.name, postal_code: @landlord.postal_code, state: @landlord.state, website: @landlord.website }
    assert_redirected_to landlord_path(assigns(:landlord))
  end

  test "should destroy landlord" do
    assert_difference('Landlord.count', -1) do
      delete :destroy, id: @landlord
    end

    assert_redirected_to landlords_path
  end
end
