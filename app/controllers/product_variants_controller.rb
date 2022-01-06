class ProductVariantsController < ApplicationController
  include ProductVariantsHelper
  before_action :set_product_variant, only: %i[ show edit update soft_destroy destroy ]
  

  # GET /product_variants/1 or /product_variants/1.json
  def show
  end

  # GET /product_variants/new
  def new
    @product_variant = ProductVariant.new

    authorize @product_variant
  end

  # GET /product_variants/1/edit
  def edit
  end

  # POST /product_variants or /product_variants.json
  def create
    
    @product_variant = ProductVariant.new(product_variant_params)
    authorize @product_variant
    @product_variant.user_id = current_user.id
    respond_to do |format|
      if @product_variant.save
        format.html { redirect_to @product_variant, notice: I18n.t('product_variant_created') }
        format.json { render :show, status: :created, location: @product_variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_variants/1 or /product_variants/1.json
  def update
    respond_to do |format|
      if @product_variant.update(product_variant_params)
        format.html { redirect_to @product_variant, notice: I18n.t('product_variant_updated') }
        format.json { render :show, status: :ok, location: @product_variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_variants/1 or /product_variants/1.json
  def destroy
    authorize @product_variant    
    @product_variant.user_id = current_user.id
    @product_variant.destroy
    respond_to do |format|
      format.html { redirect_to @product_variant.product, notice: I18n.t('product_variant_destroyed') }
      format.json { head :no_content }    
    end 
  end

  # soft destroy
  def soft_destroy        
    authorize @product_variant
    @product_variant.discard    
    respond_to do |format|
      format.html { redirect_to @product_variant.product, notice: I18n.t('product_variant_destroyed') }
      format.json { head :no_content }
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def product_variant_params
      params.require(:product_variant).permit(:batch_no, :weight, :price, :quantity, :remove_main_image,  :main_image, :expiry, :product_id, :user_id, :category_id, other_images: [])
    end

   
end
