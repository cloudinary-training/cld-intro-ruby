Basic::Application.routes.draw do
  root :to => 'demo#index'
  get 'demo/fetch'
  get 'demo/autoupload'
  get 'demo/optimization'
  get 'demo/aesthetics'
end
