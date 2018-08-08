Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"

  get 'restaurants/index', to: "restaurants#index"

  resources :restaurants do
    resources :reviews, only: [ :new, :create ]

    collection do
      get "top", to: "restaurants#top"
    end


  end
end

# Add a new review
# reviews#new
# GET /restaurants


# reviews#create
# POST /restaurants/:id/reviews
