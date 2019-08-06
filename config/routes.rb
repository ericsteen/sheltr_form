Rails.application.routes.draw do
  root to: "questionnaires#index"

  scope "/", defaults: { format: :json } do
    resources :questionnaires
    resources :user_answers
    resources :user_questionnaires
    resources :question_answers
    resources :questions
    resources :sections
    resources :user
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
