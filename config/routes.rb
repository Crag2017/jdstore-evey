Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'welcome#index'
  devise_for :users

  namespace :admin do
    resources :products
    resources :orders do
     member do
       post :cancel
       post :ship
       post :shipped
       post :return
     end
   end
  end




  resources :products do
    member do
      post :add_to_cart
      post :favorite
      post :unfavorite
    end
    collection do
      get :search
    end
    resources :reviews
  end



  resources :favorites

resources :carts do
  collection do
    delete :clean
    post :checkout
  end
end

namespace :account do
  resources :orders
end

  resources :orders do
    member do
     post :pay_with_alipay
     post :pay_with_wechat
     post :apply_to_cancel
    end
  end



    resources :cart_items
    resources :orders
    resources :products_mu
    resources :products_ci
    resources :products_shi
    resources :protfolio

end
