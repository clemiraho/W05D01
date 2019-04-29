Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
  get '/', to: 'dynamic#home'
  get '/welcome/:first_name', to: 'dynamic#welcome'
  get '/gossip/:id', to: 'dynamic#gossip', as: 'gossip'
  get '/user/:id', to: 'dynamic#user', as: 'user'
end
