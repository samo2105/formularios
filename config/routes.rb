Rails.application.routes.draw do
  get 'sales/new'
  post 'sales/create', as: 'sales'
  get 'sales/done', to: 'sales#done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
