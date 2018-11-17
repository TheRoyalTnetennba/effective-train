require "test_helper"

class WishListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wish_list = wish_lists(:one)
  end

  test "should get index" do
    get wish_lists_url, as: :json
    assert_response :success
  end

  test "should create wish_list" do
    assert_difference("WishList.count") do
      post wish_lists_url, params: {wish_list: {}}, as: :json
    end

    assert_response 201
  end

  test "should show wish_list" do
    get wish_list_url(@wish_list), as: :json
    assert_response :success
  end

  test "should update wish_list" do
    patch wish_list_url(@wish_list), params: {wish_list: {}}, as: :json
    assert_response 200
  end

  test "should destroy wish_list" do
    assert_difference("WishList.count", -1) do
      delete wish_list_url(@wish_list), as: :json
    end

    assert_response 204
  end
end
