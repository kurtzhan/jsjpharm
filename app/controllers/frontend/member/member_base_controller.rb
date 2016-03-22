class Frontend::Member::MemberBaseController < Frontend::ApplicationController
  before_action :authenticate_user!

  layout 'category'
end