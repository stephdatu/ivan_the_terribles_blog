IvanTheTerriblesBlog::Application.routes.draw do

  resources :posts do
    resources :comments do
      resources :replies
    end
  end

  root to: 'posts#index'

end

