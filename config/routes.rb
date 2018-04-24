# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
