Rails.application.routes.draw do
  root 'users#home'
  post '/users/register' => 'users#register'
  post '/users/login' => 'users#login'
  get '/professional_profile' => 'users#profess_profile'
  get '/users' => 'users#index'
  get '/logout' => 'users#logout'
  get '/users/:id' => 'users#show'
  get '/invite/accept/:id' => 'invites#accept'
  get '/invite/destroy/:id' => 'invites#destroy'
  get '/invite/send/:id' => 'invites#create'
  get '/network/destroy/:id' => 'users#networkdest'
 end
