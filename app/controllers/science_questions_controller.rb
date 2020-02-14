class ScienceQuestionsController < ApplicationController
  def index
    @questions = ScienceQuestionsFetchService.new.random_questions_list
  end
end
