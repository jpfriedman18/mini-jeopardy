require 'test_helper'

class ScienceQuestionsFetchServiceTest < Minitest::Test

  def service
    VCR.use_cassette("science_questions") do
      @_service ||= ScienceQuestionsFetchService.new
    end
  end

  def test_service_instantiates_correctly
    assert service.instance_variable_get(:@available_questions).present?
  end

  def test_nil_point_value_questions_excluded
    assert service.random_questions_list.none?{ |q| q.value.nil? }
  end

  def test_questions_correctly_ordered
    questions = service.random_questions_list
    values = questions.map(&:value)
    assert values == values.sort
  end

end
