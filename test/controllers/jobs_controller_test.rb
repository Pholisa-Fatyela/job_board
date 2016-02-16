require "test_helper"

class JobsControllerTest < ActionController::TestCase
  include Devise::TestHelpers


  setup do
    sign_in users(:user1)
    @job = jobs(:job1)
  end

  test "should get the index" do
    get :index
    assert_response :success
  end

  test "should get new job" do
    get :new
    binding.pry
    assert_response :success
    assert_select 'form'
  end

  test "should create job" do
    sign_in users(:user1)
    assert_difference('Job.count') do
      post :create, job: {title: @job.title, description: @job.description }
    end
    assert_redirected_to jobs_path
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

  # test "should edit a job" do
  #
  # end
  #
  # test "should update job" do
  #
  # end
  #
  # test "should delete a job" do
  #
  # end

end
