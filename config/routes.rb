Rails.application.routes.draw do
  get 'article/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'welcome/home', to: 'welcome#home'
get 'welcome/about', to: 'welcome#about'

resources :articles do
	  resources :comments
end


end
