require 'test_helper'

class ScienceQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get science_questions_index_url
    assert_response :success
  end

end