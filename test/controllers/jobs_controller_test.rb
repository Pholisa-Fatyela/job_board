require "test_helper"

class JobsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @job = users(:user1)
    sign_in users(:user1)
  end

  test "should get the index" do
    get :index
    assert_response :success
  end

  test "should get new job" do
    get :new
    assert_response :success
    assert_select 'form'
  end

  test "should create new job" do
    assert_difference 'Job.count' do
      post :create, job: {title: 'Caretaker', description: "Will take care of the complex" }
    end
    assert_redirected_to jobs_url
    assert_equal 'Job created!', flash[:notice]
  end

  test "create fail" do
    assert_no_difference 'Job.count' do
      post :create, job: {title: "", description: ""}
    end
    assert_template file: nil
  end

  test "should be valid" do
    assert @job.valid?
  end

  test "should show job" do
    get :index, {'title' => "Chef"}
    assert_response :success
  end

  test "should edit a job" do

  end

  test "should update job" do

  end

  test "should delete a job" do

  end

end
