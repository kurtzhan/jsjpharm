class AdminBaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_role

  layout 'backend'

  def check_user_role
  	raise if current_user.id != 1
  end
end
