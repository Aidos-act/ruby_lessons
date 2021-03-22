Rails.application.routes.draw do

  devise_for :users

  resources :authors#, only: [:show]

  resource :record 

  resources :books do
    resources :fan_comments
    resources :reviews
  end

  

  root 'books#index'

  #List tests
    get 'hello/list'

  #Main section
    get 'books/new'
    get 'books/destroy'
    get 'books/update'
    get 'books/edit'

  #View tests
    get 'view/keyword'
    get 'view/form_for'
    get 'view/select'
    get 'view/simple_format'
    get 'view/tests'
    get 'view/truncate'
    get 'view/excerpt'
    get 'view/highlight'
    get 'view/con'
    get 'view/sanitize'
    get 'view/number_to'
    get 'view/datetime'
    get 'view/linkif'
    get 'view/multi'
    get 'view/partial_basic'
    get 'view/partial_param'
    get 'view/partial_col'

  #Record tests
    get 'record/find'
    get 'record/find_by'
    get 'record/find_by2'
    get 'record/where'
    get 'record/select'
    get 'record/index'
    get 'record/distinct'
    get 'record/limit'
    get 'record/page'
    get 'record/groupby'
    get 'record/havingby'
    get 'record/unscope'
    get 'record/none(/:id)' => 'record#none'
    get 'record/pluck'
    get 'record/scope'
    get 'record/def_scope'
    get 'record/count'
    get 'record/average'
    get 'record/groupby2'
    get 'record/literal_sql'
    get 'record/update_all'
    get 'record/update_all2'
    get 'record/enum_rec'



	

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
