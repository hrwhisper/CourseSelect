Rails.application.routes.draw do
  get 'grades/export' => "grades#export"
  get 'grades/stastics' => "grades#stastics"
  post 'grades/stastics' => "grades#stastics"
  post 'grades/import' => "grades#import"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homes#index'

  resources :courses do
    member do
      get :quit
      get :open
      get :close
      get :student_list
      get :course_outline
      get :course_discuss
      get :edit_outline
    end
    collection do
      get :my_course_list
      post :my_course_list
      post :save_discuss
      post :select
      get :list
      post :list
    end
  end

  resources :discusss
  resources :discussions, only: [:index, :update]
  
  
  resources :grades, only: [:index, :update]
  resources :discussions
  resources :grades, only: [:index, :update, :export, :import,:stastics]
  resources :users
  resources :notices
  
  resources :discussions do
    member do
    end
    collection do
      post :update
    end
  end
  
  resources :comments do
    member do
    end
    collection do
      get :list
    end
  end


  get 'sessions/login' => 'sessions#new'
  post 'sessions/login' => 'sessions#create'
  delete 'sessions/logout' => 'sessions#destroy'

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
