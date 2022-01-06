require "application_system_test_case"

class ProductVariantsTest < ApplicationSystemTestCase
  setup do
    @product_variant = product_variants(:one)
  end

  test "visiting the index" do
    visit product_variants_url
    assert_selector "h1", text: "Product Variants"
  end

  test "creating a Product variant" do
    visit product_variants_url
    click_on "New Product Variant"

    fill_in "Batch no", with: @product_variant.batch_no
    fill_in "Expiry", with: @product_variant.expiry
    fill_in "Price", with: @product_variant.price
    fill_in "Products", with: @product_variant.products_id
    fill_in "Quantity", with: @product_variant.quantity
    fill_in "Weight", with: @product_variant.weight
    click_on "Create Product variant"

    assert_text "Product variant was successfully created"
    click_on "Back"
  end

  test "updating a Product variant" do
    visit product_variants_url
    click_on "Edit", match: :first

    fill_in "Batch no", with: @product_variant.batch_no
    fill_in "Expiry", with: @product_variant.expiry
    fill_in "Price", with: @product_variant.price
    fill_in "Products", with: @product_variant.products_id
    fill_in "Quantity", with: @product_variant.quantity
    fill_in "Weight", with: @product_variant.weight
    click_on "Update Product variant"

    assert_text "Product variant was successfully updated"
    click_on "Back"
  end

  test "destroying a Product variant" do
    visit product_variants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product variant was successfully destroyed"
  end
end
