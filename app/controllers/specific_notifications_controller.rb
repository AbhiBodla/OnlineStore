class SpecificNotificationsController < ApplicationController
  before_action :set_specific_notification, only: %i[ show edit update destroy ]

  # GET /specific_notifications or /specific_notifications.json
  def index
    @specific_notifications = SpecificNotification.all
  end

  # GET /specific_notifications/1 or /specific_notifications/1.json
  def show
  end

  # GET /specific_notifications/new
  def new
    @specific_notification = SpecificNotification.new
  end

  # GET /specific_notifications/1/edit
  def edit
  end

  # POST /specific_notifications or /specific_notifications.json
  def create
    @specific_notification = SpecificNotification.new(specific_notification_params)

    respond_to do |format|
      if @specific_notification.save
        format.html { redirect_to @specific_notification, notice: I18n.t('specific_notification_created') }
        format.json { render :show, status: :created, location: @specific_notification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specific_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specific_notifications/1 or /specific_notifications/1.json
  def update
    respond_to do |format|
      if @specific_notification.update(specific_notification_params)
        format.html { redirect_to @specific_notification, notice: I18n.t('specific_notification_updated') }
        format.json { render :show, status: :ok, location: @specific_notification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specific_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specific_notifications/1 or /specific_notifications/1.json
  def destroy
    @specific_notification.destroy
    respond_to do |format|
      format.html { redirect_to specific_notifications_url, notice: I18n.t('specific_notification_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_notification
      @specific_notification = SpecificNotification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specific_notification_params
      params.require(:specific_notification).permit(:user_id, :notification_id)
    end
end
