require "test_helper"

class JobsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @job = users(:user1)
  end

  test "should get the index" do
    sign_in users(:user1)
    get :index
    assert_response :success
  end

  test "should get new job" do
    sign_in users(:user1)
    get :new
    assert_response :success
    assert_select 'form'
  end

  test "should create new job" do
    sign_in users(:user1)
    assert_difference 'Job.count' do
      post :create, job: {title: 'Caretaker', description: "Will take care of the complex" }
    end
    assert_redirected_to jobs_url
    assert_equal 'Job created!', flash[:notice]
  end
  #
  # def test_create_fail
  #   assert_no_difference 'Category.count' do
  #     post :create, category: {name: ''}
  #   end
  #   assert_template 'new'
  # end
  #

end
