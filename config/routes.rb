Karenfarzam::Application.routes.draw do
  

  # Contact form
  post 'contacts' => 'contacts#create', as: :contact, defaults: { format: :json }

  root 'site#index'
end
