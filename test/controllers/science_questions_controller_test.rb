require 'test_helper'

class ScienceQuestionsControllerTest < ActionDispatch::IntegrationTest

    test "should get index" do
      VCR.use_cassette("science_questions") do
        ScienceQuestionsFetchService.any_instance.expects(:random_questions_list).once
        get science_questions_url
        assert_response :success
        assert_match "Questions About Science!", @response.body
      end
    end

    test "should render error view when error is raised" do
      VCR.use_cassette("science_questions") do
        ScienceQuestionsFetchService.any_instance.stubs(:random_questions_list).raises
        get science_questions_url
        assert_response :success
        assert_match "Oh no! Something went wrong!", @response.body
      end
    end

end
