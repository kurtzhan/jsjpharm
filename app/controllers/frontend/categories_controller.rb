class Frontend::CategoriesController < Frontend::ApplicationController
  def index
  end

  def show
    #@category_hash = Category.get_all_categories(true)
    @category = Category.find(params[:id])
    if @category.parent_category_id
      @products = @category.products
    else
      category_ids = @category.children.map(&:id).unshift @category.id
      @products = Product.where(:category_id => category_ids)
    end
    if @products.length > 0
      @tags = ActsAsTaggableOn::Tag.joins("INNER JOIN `taggings` ON `tags`.`id` = `taggings`.`tag_id` WHERE `taggings`.`taggable_id` in (#{@products.map(&:id).join(",")}) AND `taggings`.`taggable_type` = 'Product' AND (taggings.context = 'tags' AND taggings.tagger_id IS NULL)")
    else
      @tags = []
    end

    if params[:tag]
      @products = @products.tagged_with(params[:tag])
    end
  end
end
