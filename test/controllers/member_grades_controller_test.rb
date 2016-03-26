require 'test_helper'

class MemberGradesControllerTest < ActionController::TestCase
  setup do
    @member_grade = member_grades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_grades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_grade" do
    assert_difference('MemberGrade.count') do
      post :create, member_grade: { name: @member_grade.name }
    end

    assert_redirected_to member_grade_path(assigns(:member_grade))
  end

  test "should show member_grade" do
    get :show, id: @member_grade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_grade
    assert_response :success
  end

  test "should update member_grade" do
    patch :update, id: @member_grade, member_grade: { name: @member_grade.name }
    assert_redirected_to member_grade_path(assigns(:member_grade))
  end

  test "should destroy member_grade" do
    assert_difference('MemberGrade.count', -1) do
      delete :destroy, id: @member_grade
    end

    assert_redirected_to member_grades_path
  end
end
