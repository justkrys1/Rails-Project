Assignment1::Application.routes.draw do
  get "user/first_name"
  get "user/last_name"
  get "user/password"
  get "user/newsletter"
  resources :editorials

  devise_for :users
  resources :reviews
  resources :products do
    resources :reviews
  end

  resources :blogs do
    resources :comments
  end

  get 'editorial/:id/mail' => 'editorials#mail', :as => 'email_editorial'
  get 'editorial/:id/spam' => 'editorials#spam', :as => 'spam_editorial'

  get 'store/index'
  get 'store/show/:id' => 'store#show', :as => 'store_show'
  #resources :ArticlesController
  get 'about'  => 'page#about'
  get 'calendar(/:year(/:month))' => 'page#calendar', :as =>'calendar'
  match 'contact'  => 'page#contact', :via => [:post, :get]
  get 'index' => 'page#index'
  get 'login'  => 'page#login'
  get 'preferences' => 'page#preferences'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#index'

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
