Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'books' => 'books#index',as:'books_path'
  get 'books/:id' => 'books#show'
  post 'books' => 'books#create'
end
