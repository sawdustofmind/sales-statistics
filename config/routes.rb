Rails.application.routes.draw do
  root 'main#index'
  resources :sales, :only => ['index', ], :defaults => { :format => :json }
end
