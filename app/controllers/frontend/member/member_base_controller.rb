class Frontend::Member::MemberBaseController < Frontend::ApplicationController
  before_action :authenticate_user!
  before_action :check_user_role

  layout 'category'

  def check_user_role
    raise if current_user.has_role?("会员") == false
  end

end