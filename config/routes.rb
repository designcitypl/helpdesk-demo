DemoHelpdesk::Application.routes.draw do
  mount Helpdesk::Engine, :at => '/helpdesk'
  devise_for :users

  root :to => 'home#index'

end
