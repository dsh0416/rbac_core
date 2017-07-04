Rails.application.routes.draw do
  resources :projects, except: [:show] do
    resources :tasks, except: [:show]
  end

  resources :users, except: [:show]

  get "sign_in_as/:id", to: "session#sign_in_as", as: :sign_in_as
  delete "sign_out", to: "session#sign_out", as: :sign_out

  root "home#index"
end
