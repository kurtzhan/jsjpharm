class UserDeliveryAddressesController < AdminBaseController
  before_action :set_user_delivery_address, only: [:show, :edit, :update, :destroy]

  # GET /user_delivery_addresses
  # GET /user_delivery_addresses.json
  def index
    @user_delivery_addresses = UserDeliveryAddress.all
  end

  # GET /user_delivery_addresses/1
  # GET /user_delivery_addresses/1.json
  def show
  end

  # GET /user_delivery_addresses/new
  def new
    @user_delivery_address = UserDeliveryAddress.new
  end

  # GET /user_delivery_addresses/1/edit
  def edit
  end

  # POST /user_delivery_addresses
  # POST /user_delivery_addresses.json
  def create
    @user_delivery_address = UserDeliveryAddress.new(user_delivery_address_params)

    respond_to do |format|
      if @user_delivery_address.save
        format.html { redirect_to @user_delivery_address, notice: 'User delivery address was successfully created.' }
        format.json { render :show, status: :created, location: @user_delivery_address }
      else
        format.html { render :new }
        format.json { render json: @user_delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_delivery_addresses/1
  # PATCH/PUT /user_delivery_addresses/1.json
  def update
    respond_to do |format|
      if @user_delivery_address.update(user_delivery_address_params)
        format.html { redirect_to @user_delivery_address, notice: 'User delivery address was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_delivery_address }
      else
        format.html { render :edit }
        format.json { render json: @user_delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_delivery_addresses/1
  # DELETE /user_delivery_addresses/1.json
  def destroy
    @user_delivery_address.destroy
    respond_to do |format|
      format.html { redirect_to user_delivery_addresses_url, notice: 'User delivery address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_delivery_address
      @user_delivery_address = UserDeliveryAddress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_delivery_address_params
      params.require(:user_delivery_address).permit(:user_id, :province_id, :city_id, :district_id, :address, :telephone, :receiver)
    end
end
