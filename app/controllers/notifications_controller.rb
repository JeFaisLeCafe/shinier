
class NotificationsController < ApplicationController
  before_action :set_notifications
  skip_after_action :verify_authorized

  def index

  end

  def mark_as_read
    if params[:id]
      @notification = Notification.find(params[:id])
      # @notification.update_attribute({read_at: Time.zone.now})
      @notification.read_at = Time.zone.now
      @notification.save
    else
      @notifications.update_all({read_at: Time.zone.now})
    end
    redirect_back fallback_location: root_path
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end

end
