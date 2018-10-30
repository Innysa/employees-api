Rails.application.routes.draw do
	scope 'api/v1', defaults: { :format => :json } do
	  resources :employees
	  resources :departments, only: :index
	end
end
