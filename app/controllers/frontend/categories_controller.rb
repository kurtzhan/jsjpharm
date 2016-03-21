class Frontend::CategoriesController < ApplicationController
  layout 'category'
  
  def index
  end

  def show
    @category_hash = Category.get_all_categories(true)
    @category = Category.find(params[:id])
  end
end
