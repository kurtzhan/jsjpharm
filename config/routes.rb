Rails.application.routes.draw do
  # namespace :frontend do
  # namespace :member do
  #   get 'home/index'
  #   end
  # end

  post '/products/add_to_cart' => 'frontend/products#add_to_cart'
  scope module: 'frontend', as: 'frontend' do
    resources :categories, only: [:show]
    resources :products, only: [:show] do
      resources :comments
    end
    namespace :member do
      get '/' => 'home#index', as: :member_root
      resources :user_delivery_addresses
      #get 'delivery_addresses/' => 'delivery_addresses#index', as: :delivery_addresses
    end
  end

  devise_for :users
  scope '/backend' do
    resources :categories
    resources :products
    resources :brands
    resources :users
    resources :roles
    resources :member_grades
    resources :user_delivery_addresses
    get '/' => 'home#index', as: :backend_root
  end
  
  namespace :frontend do
  get 'home/index'
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root controller: 'frontend/home', action: 'index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
