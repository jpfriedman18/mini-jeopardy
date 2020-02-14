require 'test_helper'

class ScienceQuestionsControllerTest < ActionDispatch::IntegrationTest

    test "should get index" do
      VCR.use_cassette("science_questions") do
        ScienceQuestionsFetchService.any_instance.expects(:random_questions_list).once
        get science_questions_url
        assert_response :success
      end
    end

end
