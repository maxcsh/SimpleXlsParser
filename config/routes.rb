Rails.application.routes.draw do
  
  resources :pocket_cashes do
    collection do
      get :upload
      post :upload
      post :save
    end
  end

  resources :bills do
    collection do
      get :upload
      post :upload
      post :save
    end
  end

  resources :business_cards do
    collection do
      get :upload
      post :upload
      post :save
    end
  end

  resources :customers

  root "pocket_cashes#index"

end
