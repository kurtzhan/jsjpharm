class Category < ActiveRecord::Base
  has_many :products
  before_save :check_validation

  def self.get_all_categories(return_hash = false)
  	hash = {}
  	Category.all.order("parent_category_id").each do |c|
      if c.parent_category_id.nil?
      	hash[c] ||= []
      else
      	array = find_category_array(c.parent_category_id, hash)
      	array ||= []
      	array << {c => []}
      end
  	end
  	return hash if return_hash
  	array = []
  	build_category_hierachy(array, hash, "--")
  	array.unshift(["顶级分类", nil])
  	return array
  end

  def check_validation
    if self.new_record? == false && self.parent_category_id_changed?
      raise 'The category can not be moved to itself' if self.id == self.parent_category_id
      c = Category.find self.parent_category_id
      array = []
      array = c.category_path
      raise 'The category can not be moved to its children category' if array.map{|item| item[1]}.include?(self.id)
    end
  end

  def category_path
    array = []
    build_category_path(self, array)
    return array
  end

private
  def build_category_path(category, array)
  	array.unshift [category.name, category.id]
    if category.parent_category_id.nil?
      return array
    else
      parent_category = Category.find category.parent_category_id
      build_category_path(parent_category, array)
    end
  end

  def self.find_category_array(category_id, hash)
  	array = nil
    hash.keys.each do |category|
      if category.id == category_id
        return hash[category]
  	  end
 
      hash[category].each do |sub_hash|
        array = find_category_array(category_id, sub_hash)
        return array if array
  	  end
    end

    return array
  end

  def self.build_category_hierachy(array, hash, prefix = "")
    hash.keys.each do |category|
      array << [prefix + category.name, category.id]
      hash[category].each do |sub_hash|
        build_category_hierachy(array, sub_hash, prefix + "--")
      end
    end
  end

end
