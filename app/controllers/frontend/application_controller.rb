class Frontend::ApplicationController < ApplicationController
  before_action :get_all_category
  include ApplicationHelper

  layout 'frontend'

  def get_all_category
    @category_hash = Category.get_all_categories(true)
  end
end
