class ProductServicesController < ApplicationController
  before_action :set_product_service, only: %i[ show edit soft_destroy update destroy ]

  # GET /product_services or /product_services.json
  def index
    ProductService.reindex
      @query = params[:search_query]
      if @query != nil 
        if(signed_in? && current_user.role == "admin")       
              product_services = ProductService.pagy_search(@query, fields: ['name^5','desc'],  misspellings: {below: 3, edit_distance: 1} )
              @pagy, @product_services = pagy_searchkick(product_services, items: 10)
        else                   
              product_services = {discarded_at: nil}
              all_service =  ProductService.pagy_search(@query,where: product_services, fields: ['name^5','desc'],  misspellings: {below: 3, edit_distance: 1} )              
              @pagy, @product_services = pagy_searchkick(all_service, items: 10)              
        end
      else
          if (signed_in? && current_user.role == "admin")
              @pagy, @product_services = pagy(ProductService.all)
          else
              @pagy, @product_services = pagy(ProductService.kept)
          end
      end
  end

  # GET /product_services/1 or /product_services/1.json
  def show
  end

  # GET /product_services/new
  def new
    @product_service = ProductService.new

    authorize @product_service
  end

  # GET /product_services/1/edit
  def edit
    authorize @product_service
  end

  # POST /product_services or /product_services.json
  def create
    @product_service = ProductService.new(product_service_params)
    
    @product_service.user_id = current_user.id

    authorize @product_service
   
    respond_to do |format|
      if @product_service.save
        ActionCable.server.broadcast("room_channel", {content: "Seller added a new Service ", for_user: "all" })
        format.html { redirect_to @product_service, notice: I18n.t('product_service_created') }
        format.json { render :show, status: :created, location: @product_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_services/1 or /product_services/1.json
  def update
    respond_to do |format|
      authorize @product_service
      if @product_service.update(product_service_params)
        format.html { redirect_to @product_service, notice: I18n.t('product_service_updated') }
        format.json { render :show, status: :ok, location: @product_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_services/1 or /product_services/1.json
  def destroy
    authorize @product_service
    @product.user_id = current_user.id
    @product_service.destroy
    respond_to do |format|
      format.html { redirect_to product_services_url, notice: I18n.t('product_service_destroyed')}
      format.json { head :no_content }
    end
  end

  def soft_destroy   
    @product_service.discard
    respond_to do |format|
      format.html { redirect_to product_services_url, notice: I18n.t('product_service_destroyed') }
      format.json { head :no_content }
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_service
      @product_service = ProductService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_service_params
      params.require(:product_service).permit(:name, :code, :desc, :price, :date, :start_time, :end_time, :duration, :category_id, :user_id)
    end
end
