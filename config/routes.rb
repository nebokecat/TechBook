Rails.application.routes.draw do
  devise_for :users,
    controllers: { 
      omniauth_callbacks: 'users/omniauth_callbacks' 
    }
  root to:'home#index'
  resources:users,param: :user_name
  resources:books,param: :book_id
end
