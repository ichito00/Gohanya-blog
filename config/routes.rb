Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
end
