class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit soft_destroy update destroy ]

  # GET /products or /products.json
  def index
    Product.reindex
   @query = params[:search_query]
     if @query != nil
          if( signed_in? && current_user.role = "admin") 
              products = Product.pagy_search(@query, fields: ['name^5','desc'],  misspellings: {below: 3, edit_distance: 1} ) 
              @pagy, @products = pagy_searchkick(products, items: 10)
          else
              products = {discarded_at: nil}
              all_products =  Product.pagy_search(@query,where: products, fields: ['name^5','desc'],  misspellings: {below: 3, edit_distance: 1} )
              @pagy, @products = pagy_searchkick(all_products, items: 10)
          end
     else      
        if (signed_in? && current_user.role == "admin")
           @pagy, @products = pagy(Product.all)
        else
          @pagy, @products = pagy(Product.kept)
        end
     end
  end

  # GET /products/1 or /products/1.json
  def show
    if (signed_in? && current_user.role == "admin")
      @product_variants = ProductVariant.where(product_id: @product.id)
    else 
      @product_variants = ProductVariant.where(product_id: @product.id).kept
    end
  end

  # GET /products/new
  def new
    @product = Product.new
     @product.product_variants.build

     authorize @product
  end

  # GET /products/1/edit
  def edit

    
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    authorize @product
       
    respond_to do |format|
      if @product.save
        ActionCable.server.broadcast("room_channel", {content: "Seller added a new Product ", for_user: "all" })
        format.html { redirect_to @product, notice: I18n.t('product_created') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: I18n.t('product_updated')  }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    authorize @product   
    @product.user_id = current_user.id
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: I18n.t('product_destroyed')  }
      format.json { head :no_content }
    end
  end

  def soft_destroy   
   
      @product.discard
      respond_to do |format|
        format.html { redirect_to products_url, notice: I18n.t('product_destroyed') }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])

      
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :code, :image_name, :remove_main_image, :main_image, :desc, :price, :qty, :total_amount, :id, :category_id, other_images: [], product_variants_attributes: [ :product_id, :batch_no, :weight, :remove_main_image, :main_image, :price, :quantity, :expiry, :user_id, :category_id, other_images: []])
    end

   
     



end
