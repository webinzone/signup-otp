Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "acme/registrations"}
  post 'verifications' => 'verifications#create'
  put 'verifications' => 'verifications#verify'
end
