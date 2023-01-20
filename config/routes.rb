Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: %i[index show update]
    end
  end
end
