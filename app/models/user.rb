class User < ActiveRecord::Base
  after_commit :assign_user_role, on: :create
  belongs_to :member_grade
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def assign_user_role
    if has_role?("会员") == false
      add_role("会员") 
    end
  end
end
