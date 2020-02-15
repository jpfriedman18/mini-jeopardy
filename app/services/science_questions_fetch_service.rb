class ScienceQuestionsFetchService

  # Constants
  DEFAULT_OPTS = {
    category: 25,
    min_date: "1996-01-01".to_time,
    max_date: "1996-12-31".to_time
  }

  def initialize
    @available_questions = fetch_available_questions
  end

  # Returns an ordered array withone JAPI::Clue object for each unique point value
  # present in all the clues in @available_questions.
  # NOTE: presently, the elements in the result array are only used for displaying
  # the question text and its associated point value, however each of the objects
  # also has an #answer method. In future iterations, the answers can be used in the view
  # to allow users to play
  def random_questions_list
    result = []
    available_point_values.each do |point_value|
      questions = @available_questions.select{ |q| q.value == point_value }
      result << questions.sample
    end
    result
  end

  private

  # Returns an array of the possible point values for all questions returned by the jAPI query
  # NOTE: some questions have a nil value for their point value, indicating that they
  # were used for Final Jeopardy. We do not want to display those, so .compact is
  # called here to remove it from the array of possible point values.
  # Most of the time this should return [100, 200, 300, 400, 500], however it ensures
  # we won't try to display any questions that don't exist in the list from the API
  def available_point_values
    @available_questions.map(&:value).uniq.compact.sort
  end

  def fetch_available_questions
    JAPI::Trebek.clues(DEFAULT_OPTS)
  end

end
