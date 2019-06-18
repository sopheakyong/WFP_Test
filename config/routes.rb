Rails.application.routes.draw do

  namespace 'api' do
      namespace 'v1' do
        resources :students, only: :index
        get 'students/get_student'
      end
  end

  resources :student_performances
  resources :student_schools
  resources :schools
  resources :students
  resources :users
  
  #resources :reports, only: [:show]
  get 'reports/index'
  get 'reports/performance_pdf' , to: 'reports#performance_pdf'
  get 'reports/pdf' , to: 'reports#show'
  get 'reports/performance_graph' , to: 'reports#performance_graph'
  

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

 
  root 'sessions#new'



  


  get '/search' => 'welcome#index', :as => 'search_page'
  get 'students/register' => 'students#new', :as => 'register'
  get '/students/student_register', to: 'students#new'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
