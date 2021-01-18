Rails.application.routes.draw do
  api_version(:module => "V2", :header => {:name => "Accept", :value => "application/vnd.boilerplate-rails.com; version=2"}) do
      resources :users
    end
  api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.boilerplate-rails.com; version=1"}) do
      resources :users do
        collection do
          post :login
        end
      end
    end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
