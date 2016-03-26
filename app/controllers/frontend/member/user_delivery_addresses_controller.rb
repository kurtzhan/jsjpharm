class Frontend::Member::UserDeliveryAddressesController < Frontend::Member::MemberBaseController
  def index
  	@category_hash = Category.get_all_categories(true)
  	@delivery_addresses = current_user.user_delivery_addresses
  end

  def show
  	@category_hash = Category.get_all_categories(true)
  end

  def edit
  end

  def new
  end

  def update
    user_delivery_address = UserDeliveryAddress.find params[:id]
    raise 'unauthorized' if user_delivery_address.user_id != current_user.id

	respond_to do |format|
      if user_delivery_address.update(user_delivery_address_params)
        format.html { redirect_to frontend_member_user_delivery_address_path(user_delivery_address), notice: 'User delivery address was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_delivery_address }
      else
        format.html { render :edit }
        format.json { render json: @user_delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end

  private
	def user_delivery_address_params
	  params.require(:user_delivery_address).permit(:province_id, :city_id, :district_id, :address, :telephone, :receiver)
	end
end
