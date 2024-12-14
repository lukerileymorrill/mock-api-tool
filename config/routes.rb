Rails.application.routes.draw do
  namespace :api do
    resources :mock_apis
  end
  
  match '*path', to: 'mock_apis#handle_request', via: :all
end
