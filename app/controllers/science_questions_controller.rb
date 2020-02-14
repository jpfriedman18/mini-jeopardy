class ScienceQuestionsController < ApplicationController
  def index
    @questions = ScienceQuestionsFetchService.new.random_questions_list
  rescue
    # NOTE: the standard error page will render when any error is raised, regardless of the type of error
    # Will need to change this in the future for more nuanced error handling
    render "shared/error"
  end
end
