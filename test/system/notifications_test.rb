require "application_system_test_case"

class NotificationsTest < ApplicationSystemTestCase
  setup do
    @notification = notifications(:one)
  end

  test "visiting the index" do
    visit notifications_url
    assert_selector "h1", text: "Notifications"
  end

  test "creating a Notification" do
    visit notifications_url
    click_on "New Notification"

    fill_in "Content", with: @notification.content
    fill_in "Notification of", with: @notification.notification_of_id
    fill_in "Notification of type", with: @notification.notification_of_type
    check "Readed" if @notification.readed
    fill_in "Title", with: @notification.title
    click_on "Create Notification"

    assert_text "Notification was successfully created"
    click_on "Back"
  end

  test "updating a Notification" do
    visit notifications_url
    click_on "Edit", match: :first

    fill_in "Content", with: @notification.content
    fill_in "Notification of", with: @notification.notification_of_id
    fill_in "Notification of type", with: @notification.notification_of_type
    check "Readed" if @notification.readed
    fill_in "Title", with: @notification.title
    click_on "Update Notification"

    assert_text "Notification was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification" do
    visit notifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification was successfully destroyed"
  end
end
