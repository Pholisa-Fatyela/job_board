require "test_helper"
include Devise::TestHelpers

class JobsControllerTest < ActionController::TestCase
  # test 'test_sanity' do
  #   flunk "Need real tests"
  # end
  # def test_new
  #   get :new
  #   assert_response :success
  #   assert_select 'form'
  # end

  # def test_create
  #   assert_difference 'Job.count' do
  #     post :create, category: {title: 'Caretaker', description: "Will take care of the complex" }
  #   end
  #   assert_redirected_to categories_url
  #   assert_equal 'Category created!', flash[:notice]
  # end
  #
  # def test_create_fail
  #   assert_no_difference 'Category.count' do
  #     post :create, category: {name: ''}
  #   end
  #   assert_template 'new'
  # end
  #
  test "should get the index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobs)
  end
end
