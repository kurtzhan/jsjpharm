class MemberGradesController < AdminBaseController
  before_action :set_member_grade, only: [:show, :edit, :update, :destroy]

  # GET /member_grades
  # GET /member_grades.json
  def index
    @member_grades = MemberGrade.all
  end

  # GET /member_grades/1
  # GET /member_grades/1.json
  def show
  end

  # GET /member_grades/new
  def new
    @member_grade = MemberGrade.new
  end

  # GET /member_grades/1/edit
  def edit
  end

  # POST /member_grades
  # POST /member_grades.json
  def create
    @member_grade = MemberGrade.new(member_grade_params)

    respond_to do |format|
      if @member_grade.save
        format.html { redirect_to @member_grade, notice: 'Member grade was successfully created.' }
        format.json { render :show, status: :created, location: @member_grade }
      else
        format.html { render :new }
        format.json { render json: @member_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /member_grades/1
  # PATCH/PUT /member_grades/1.json
  def update
    respond_to do |format|
      if @member_grade.update(member_grade_params)
        format.html { redirect_to @member_grade, notice: 'Member grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @member_grade }
      else
        format.html { render :edit }
        format.json { render json: @member_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /member_grades/1
  # DELETE /member_grades/1.json
  def destroy
    @member_grade.destroy
    respond_to do |format|
      format.html { redirect_to member_grades_url, notice: 'Member grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member_grade
      @member_grade = MemberGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_grade_params
      params.require(:member_grade).permit(:name, :discount_percentage)
    end
end
