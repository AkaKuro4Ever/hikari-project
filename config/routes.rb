Rails.application.routes.draw do
  resources :comments
  resources :users, only: [:index, :create, :show, :edit, :destroy, :update] do
    resources :books, only: [:new, :show, :index, :edit]
  end
  resources :genres, only: [:index, :create, :show] do
    resources :books, only: [:index]
  end
  resources :books, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:create]
  end
  resources :sessions, only: [:create]

  #Remember to put indexes for each genre
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_FB'
  root 'application#index'
  post '/follow/:id' => 'books#follow', as: :follow
  get 'comments/:id/comment_data', to: 'comments#comment_data'
  post '/delete_comment' => 'comments#destroy', as: :destroy
  post '/unfollow/:id' => 'books#unfollow', as: :unfollow
  get '/hikari_faves' => 'books#hikari_faves'
  get '/users/:id/blog' => 'users#blog', as: :blog
  get '/users/:id/blog/edit' => 'users#editblog', as: :edit_blog
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

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
