class Frontend::CommentsController < Frontend::ApplicationController
  def create
    product = Product.find params[:product_id]
    product.comment_threads.create!(comment_params)

    redirect_to frontend_product_path(product.id), notice: 'Comment was successfully created.'
  end

private
  def comment_params
    params.require(:comment).permit(:body, :name, :email, :score)
  end
end
