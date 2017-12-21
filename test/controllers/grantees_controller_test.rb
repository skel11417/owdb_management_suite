require 'test_helper'

class GranteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grantee = grantees(:one)
  end

  test "should get index" do
    get grantees_url
    assert_response :success
  end

  test "should get new" do
    get new_grantee_url
    assert_response :success
  end

  test "should create grantee" do
    assert_difference('Grantee.count') do
      post grantees_url, params: { grantee: {  } }
    end

    assert_redirected_to grantee_url(Grantee.last)
  end

  test "should show grantee" do
    get grantee_url(@grantee)
    assert_response :success
  end

  test "should get edit" do
    get edit_grantee_url(@grantee)
    assert_response :success
  end

  test "should update grantee" do
    patch grantee_url(@grantee), params: { grantee: {  } }
    assert_redirected_to grantee_url(@grantee)
  end

  test "should destroy grantee" do
    assert_difference('Grantee.count', -1) do
      delete grantee_url(@grantee)
    end

    assert_redirected_to grantees_url
  end
end
