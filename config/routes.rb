Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', sessions: 'users/sessions',
    confirmations: 'users/confirmations', passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      get 'all_users' => 'users#index'

      # follow and unfollow user

      get    'sleeping_records'               => 'sleeping_records#index'
      post   'sleeping_records/check_in'      => 'sleeping_records#check_in'
      patch  'sleeping_records/:id/check_out' => 'sleeping_records#check_out'
      delete 'sleeping_records/:id'           => 'sleeping_records#destroy'

      # get followings
      # get the sleeping_records of the following
    end
  end
end
