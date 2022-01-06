class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit soft_destroy update destroy ]

  # GET /services or /services.json
  def index
    Service.reindex
      @query = params[:search_query]
      if @query != nil 
        if(signed_in? && current_user.role = "admin")       
              services = Service.pagy_search(@query, fields: ['name^5','desc'],  misspellings: {below: 3, edit_distance: 1} )
              @pagy, @services = pagy_searchkick(services, items: 10)
        else                   
              services = {discarded_at: nil}
              all_service =  Service.pagy_search(@query,where: services, fields: ['name^5','desc'],  misspellings: {below: 3, edit_distance: 1} )              
              @pagy, @services = pagy_searchkick(all_service, items: 10)              
        end
      else
          if (signed_in? && current_user.role = "admin")
              @pagy, @services = pagy(Service.all)
          else
              @pagy, @services = pagy(Service.kept)
          end
      end
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new

    authorize @service
  end

  # GET /services/1/edit
  def edit
    authorize @service
  end

  # POST /services or /services.json
  def create
    @service = Service.new(service_params)
    
    @service.user_id = current_user.id

    authorize @service
   
    respond_to do |format|
      if @service.save
        ActionCable.server.broadcast("room_channel", {content: "Seller added a new Service ", for_user: "all" })
        format.html { redirect_to @service, notice: I18n.t('service_created') }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      authorize @service
      if @service.update(service_params)
        format.html { redirect_to @service, notice: I18n.t('service_updated') }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    authorize @service
    @product.user_id = current_user.id
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: I18n.t('service_destroyed')}
      format.json { head :no_content }
    end
  end

  def soft_destroy   
    @service.discard
    respond_to do |format|
      format.html { redirect_to services_url, notice: I18n.t('service_destroyed') }
      format.json { head :no_content }
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :code, :desc, :price, :date, :start_time, :end_time, :duration, :category_id, :user_id)
    end
end
