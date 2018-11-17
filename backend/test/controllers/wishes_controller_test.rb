require "test_helper"

class WishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wish = wishes(:one)
  end

  test "should get index" do
    get wishes_url, as: :json
    assert_response :success
  end

  test "should create wish" do
    assert_difference("Wish.count") do
      post wishes_url, params: {wish: {}}, as: :json
    end

    assert_response 201
  end

  test "should show wish" do
    get wish_url(@wish), as: :json
    assert_response :success
  end

  test "should update wish" do
    patch wish_url(@wish), params: {wish: {}}, as: :json
    assert_response 200
  end

  test "should destroy wish" do
    assert_difference("Wish.count", -1) do
      delete wish_url(@wish), as: :json
    end

    assert_response 204
  end
end
