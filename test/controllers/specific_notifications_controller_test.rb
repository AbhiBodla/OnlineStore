require "test_helper"

class SpecificNotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specific_notification = specific_notifications(:one)
  end

  test "should get index" do
    get specific_notifications_url
    assert_response :success
  end

  test "should get new" do
    get new_specific_notification_url
    assert_response :success
  end

  test "should create specific_notification" do
    assert_difference('SpecificNotification.count') do
      post specific_notifications_url, params: { specific_notification: { notification_id: @specific_notification.notification_id, user_id: @specific_notification.user_id } }
    end

    assert_redirected_to specific_notification_url(SpecificNotification.last)
  end

  test "should show specific_notification" do
    get specific_notification_url(@specific_notification)
    assert_response :success
  end

  test "should get edit" do
    get edit_specific_notification_url(@specific_notification)
    assert_response :success
  end

  test "should update specific_notification" do
    patch specific_notification_url(@specific_notification), params: { specific_notification: { notification_id: @specific_notification.notification_id, user_id: @specific_notification.user_id } }
    assert_redirected_to specific_notification_url(@specific_notification)
  end

  test "should destroy specific_notification" do
    assert_difference('SpecificNotification.count', -1) do
      delete specific_notification_url(@specific_notification)
    end

    assert_redirected_to specific_notifications_url
  end
end
