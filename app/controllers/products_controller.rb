class ProductsController < AdminBaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :build_product, only: [:new]
  before_action :build_product_member_grade_prices, only: [:edit, :new]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @product.pictures.create(image: image)
          }
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @product.pictures.create(image: image)
          }
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :category_id, :order, :tag_list, :images, :brand_id, :market_price, :price, :short_description, :memo, :product_member_grade_prices_attributes => [:price, :member_grade_id, :id])
    end

    def build_product_member_grade_prices
      MemberGrade.all.each do |mg|
        if @product.product_member_grade_prices.map(&:member_grade_id).include?(mg.id) == false
          @product.product_member_grade_prices.build(:member_grade => mg)
        end
      end
    end

    def build_product
      @product = Product.new
    end
end
