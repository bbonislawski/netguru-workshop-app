Rails.application.routes.draw do
  devise_for :users
  root to: "visitors#index"
  resources :students do
    get :subjects
  end
  resources :teachers

  resources :visitors, only: [:index]

  scope :reports do
    get 'subjects', to: 'reports#subjects', as: 'report_subjects'
  end
end
