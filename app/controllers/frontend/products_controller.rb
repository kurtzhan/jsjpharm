class Frontend::ProductsController < Frontend::ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:add_to_cart]
  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart

  end
end
