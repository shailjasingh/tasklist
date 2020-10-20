# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tasks, only: %i[index new create] do
    post :complete
  end

  root to: 'tasks#index'
end
