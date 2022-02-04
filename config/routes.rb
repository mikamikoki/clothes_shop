Rails.application.routes.draw do

    devise_for :admin, skip: [:passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
     	resources :products,only: [:index,:new,:create,:show,:edit,:update]
     	get 'top'=>'products#top'
    	resources :genres,only: [:index,:create,:edit,:update]
    	resources :orders,only: [:index,:show,:update] do
    	  member do
      get :current_index
      resource :order_details,only: [:update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


 devise_for :customers, controllers: {
    registrations: "customer/registrations",
    sessions: 'customer/sessions'
  }

  get 'about' => 'customer/homes#about'
  root 'customer/homes#top'

  scope module: :customer do
    resources :products,only: [:index,:show,]
    get 'customer/edit' => 'customers#edit'
    patch 'customer' => 'customers#update'

  	resource :customers,only: [:show] do
  		collection do
  	     get 'out'
  	     patch 'withdraw'
  	  end

      resources :cart_products,only: [:index,:update,:create,:destroy] do
        collection do
          delete '/' => 'cart_products#destroy_all'
        end
      end

      resources :orders,only: [:new,:index,:show,:create] do
        collection do
          get 'confirm'
          get 'thanx'
        end
      end

      resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    end
  end
end