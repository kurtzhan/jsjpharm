class AdminBaseController < ApplicationController
  before_action :authenticate_user!
  
  layout 'backend'
end
