Rails.application.routes.draw do

  devise_for :users, :path_names => { :sign_up => "register" }
  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
