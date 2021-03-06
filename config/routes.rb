Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    root to: 'tasks#index'
  end

  resources :tasks do
    post 'done'
    post 'claim'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
