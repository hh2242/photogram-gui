Rails.application.routes.draw do
  root 'users#index'

  get '/users', to: 'users#index'
  get '/users/:username', to: 'users#detail'
  post '/add_user', to: 'users#add_user'
  post '/update_user/:id', to: 'users#update_user'

  get '/photos', to: 'photos#index'
  get '/photos/:id', to: 'photos#detail'
  post '/insert_photo_record', to: 'photos#insert_photo_record'
  post '/update_photo/:id', to: 'photos#update_photo'
  post '/add_comment', to: 'photos#add_comment'
  get '/delete_photo/:id', to: 'photos#delete_photo'
end
