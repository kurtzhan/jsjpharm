class Frontend::ProductsController < Frontend::ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:add_to_cart]
  def show
    @product = Product.find(params[:id])
    @comment = @product.comment_threads.build
  end

  def add_to_cart

  end
end
