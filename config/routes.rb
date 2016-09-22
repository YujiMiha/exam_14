Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
   registrations: "users/registrations" ,omniauth_callbacks: "users/omniauth_callbacks"}
   }
   resources :posts
   root 'posts#index'

   if Rails.env.development?
     mount LetterOpenerWeb::Engine, at: "/letter_opnner"
   end


end
