class UserDeliveryAddress < ActiveRecord::Base
  belongs_to :user
  belongs_to :province
  belongs_to :city
  belongs_to :district
end
