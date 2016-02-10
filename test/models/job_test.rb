require "test_helper"

class JobTest < MiniTest::Test
  def test_validation
    job = Job.new
    job.valid?
    assert job.errors.keys.include?(:description), "Saved the job without a title"
  end
end
