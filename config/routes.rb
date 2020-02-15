Rails.application.routes.draw do
  resources :science_questions, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
