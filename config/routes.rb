Rails.application.routes.draw do
  resources :sales, :only => ['index', ], :defaults => { :format => :json }
end
