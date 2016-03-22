class Frontend::Member::HomeController < Frontend::Member::MemberBaseController
  def index
  	@category_hash = Category.get_all_categories(true)
  end
end
