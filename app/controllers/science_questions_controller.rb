class ScienceQuestionsController < ApplicationController
  def index
    @clue = JAPI::Trebek.random[0]
  end
end
