Rails.application.routes.draw do
  namespace :api do
    namespace :information do
      resources :users, only: :index do
        collection do
          get :revenue_months
          get :revenue_days
        end
      end
      resources :menus, only: :index do
        collection do
          get :sort_popular
        end
      end
      resources :orders, only: :index
      resources :total_bills, only: :index do
        collection do
          get :checkout
        end
      end
      resources :coffee_tables, only: :index do
        collection do
          get :add_tables
          get :remove_tables
        end
      end
    end
  end
end
