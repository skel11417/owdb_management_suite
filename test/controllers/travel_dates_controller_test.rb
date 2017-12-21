require 'test_helper'

class TravelDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_date = travel_dates(:one)
  end

  test "should get index" do
    get travel_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_date_url
    assert_response :success
  end

  test "should create travel_date" do
    assert_difference('TravelDate.count') do
      post travel_dates_url, params: { travel_date: {  } }
    end

    assert_redirected_to travel_date_url(TravelDate.last)
  end

  test "should show travel_date" do
    get travel_date_url(@travel_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_date_url(@travel_date)
    assert_response :success
  end

  test "should update travel_date" do
    patch travel_date_url(@travel_date), params: { travel_date: {  } }
    assert_redirected_to travel_date_url(@travel_date)
  end

  test "should destroy travel_date" do
    assert_difference('TravelDate.count', -1) do
      delete travel_date_url(@travel_date)
    end

    assert_redirected_to travel_dates_url
  end
end
