Wgapp::Application.routes.draw do

  #devise_for :users #, :path => "usuarios", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }
  
  devise_for :users

  resources :wgs, :users, :buyings

  root :to => 'wgs#index'

  resources :wgs do
    get 'show', :on => :collection
    get :join_wg, :on => :member, :as => 'join_wg'
    get :change_wg, :on => :member, :as => 'change_wg'
  end

end
