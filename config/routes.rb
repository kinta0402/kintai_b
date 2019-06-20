Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/search',   to: 'users#search'
  get  '/signup',   to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/edit-basic-info/:id', to: 'users#edit_basic_info', as: :basic_info
  patch 'update-basic-info',  to: 'users#update_basic_info'
  get 'users/:id/attendances/:date/edit', to: 'attendances#edit', as: :edit_attendances #勤怠情報を編集するページ
  patch 'users/:id/attendances/:date/update', to: 'attendances#update', as: :update_attendances #勤怠情報を更新するページ
  resources :users do
    resources :attendances, only: :create
  end
end