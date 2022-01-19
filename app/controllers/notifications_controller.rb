class NotificationsController < ApplicationController
 
  before_action :set_notification, only: %i[ show edit update destroy ]
  
  # GET /notifications or /notifications.json
  def index
    @notifications = Notification.all
  end

  # GET /notifications/1 or /notifications/1.json
  def show
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications or /notifications.json
  def create
    @notification = Notification.new(notification_params)
 
    respond_to do |format|
      if @notification.save
        ActionCable.server.broadcast("room_channel", {content: @notification.content })
        format.html { redirect_to @notification, notice: I18n.t('notification_created') }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1 or /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: I18n.t('notification_updated') }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1 or /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: I18n.t('notification_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:title, :content, :readed, :notifiable_id, :notifiable_type)
    end
     
    



end
