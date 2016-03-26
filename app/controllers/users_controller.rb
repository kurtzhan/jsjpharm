class UsersController < AdminBaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  # GET /categories
  # GET /categories.json
  def index
    @users = User.all.includes(:member_grade)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @user = User.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    my_params = build_params
    @user = User.new(my_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    my_params = build_params
    respond_to do |format|
      if @user.update(my_params)
        format.html { redirect_to @user, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :member_grade_id, :roles => [])
    end

    def build_params
      my_params = user_params
      role_ids = my_params["roles"]
      my_params["roles"] = role_ids.nil? ? [] : role_ids.map{|id| Role.find id}
      my_params["member_grade_id"] = nil if my_params["roles"].map(&:name).include?("会员") == false

      return my_params
    end
end
