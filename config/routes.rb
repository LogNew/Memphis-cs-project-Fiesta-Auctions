Rails.application.routes.draw do
  get 'home', to: 'static_pages#home', as: 'home'

  resources :reviews
  resources :auctions
  
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }

  get 'about', to: 'static_pages#about', as: 'about'

  get 'users', to: 'users#index', as: 'users' 
  get 'my_payments', to: 'my_payments#index', as: 'my_payments'
  get 'my_payments/new', to: 'my_payments#new', as: "new_my_payments"
  post 'my_payments', to: 'my_payments#create'


#  get 'auctions', to: 'auctions#index', as:'auctions'
#  get 'auctions', to: 'auctions#new', as:'new_auctions'
 get 'my_auctions', to: 'my_auctions#index', as: 'my_auctions'


 get 'my_past_auctions', to: 'my_auctions#past', as: 'my_past_auctions'



  
  # users home show page route
  get "users/:id", to: 'users#show', as: 'user'


  #    <!-- Route for Update Auction page -->

  #get 'update_auction', to: 'auction#update', as: 'update_auction'
  get 'auctions/edit/:id', to: 'auctions#edit', as: 'auctions_edit'





  patch 'auctions/:id', to: 'auctions#update'
  put 'auctions/:id', to: 'auctions#update'
#    <!-- Routes Creating Bid page -->

  get 'users/:id/new_bid', to: 'bids#new', as: 'new_bid'

  post 'users/:id/new_bid', to: 'bids#create', as: 'bid_create'

  #    <!-- End Those -->
  

  get 'my_reviews', to: 'my_reviews#index', as: 'my_reviews'
  get 'won_auctions', to: 'won_auctions#index', as: 'won_auctions'

  get 'searches', to: 'searches#search', as: 'searches'

  get 'review/new', to: 'review#new', as: 'new_reviews' # route to new review

  post 'review', to: 'review#create'

  root to: redirect('/users', status: 302)

end
