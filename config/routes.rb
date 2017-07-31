Rails.application.routes.draw do
  scope :api do 
    resources :urls, only:[:index, :create]
  end

  get ':shorten_url', to: 'urls#parse'
end
