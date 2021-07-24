Rails.application.routes.draw do
  devise_for :customers, controllers: {
  registrations: 'customers/registrations',
  sessions: 'customers/sessions'
  }
  
  #
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }
end
