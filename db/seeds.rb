# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Role.count == 0
  Role.create(:name => "管理员")
  Role.create(:name => "会员")
end

if User.count == 0
  u = User.create(:email => "zlyaksa@yahoo.com", :password => "12345abc")
  u.add_role "管理员"
end

if Category.count == 0
  c = Category.create(:name => "基础")
  Category.create(:name => "改善睡眠", :parent_category_id => c.id)
  Category.create(:name => "增强免疫", :parent_category_id => c.id)
end
