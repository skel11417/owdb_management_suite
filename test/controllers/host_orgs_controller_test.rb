require 'test_helper'

class HostOrgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @host_org = host_orgs(:one)
  end

  test "should get index" do
    get host_orgs_url
    assert_response :success
  end

  test "should get new" do
    get new_host_org_url
    assert_response :success
  end

  test "should create host_org" do
    assert_difference('HostOrg.count') do
      post host_orgs_url, params: { host_org: {  } }
    end

    assert_redirected_to host_org_url(HostOrg.last)
  end

  test "should show host_org" do
    get host_org_url(@host_org)
    assert_response :success
  end

  test "should get edit" do
    get edit_host_org_url(@host_org)
    assert_response :success
  end

  test "should update host_org" do
    patch host_org_url(@host_org), params: { host_org: {  } }
    assert_redirected_to host_org_url(@host_org)
  end

  test "should destroy host_org" do
    assert_difference('HostOrg.count', -1) do
      delete host_org_url(@host_org)
    end

    assert_redirected_to host_orgs_url
  end
end
