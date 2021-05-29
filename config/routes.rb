Rails.application.routes.draw do
  Rails.application.routes.draw do
    #  Ver si el servicio está corriendo
    get '/ping' => 'health_check#pong'

    namespace :api, defaults: { format: :json } do
      namespace :v1 do

        namespace :usuarios do
          post ':id/oauth', :action => 'oauth'
          get ':id/balance', :action => 'balance'
        end

        resources :usuarios, only: [:index]

        namespace :productos do
          get '/activos', :action => 'activos'
        end

        resources :productos, only: [:show, :index]

        # resources :payloads, only: [:show, :index, :update, :create, :destroy]

        # resources :masking_rules, only: [:index]

        # resources :masks, only: [:create]

        # namespace :payload_masking_rules do
        #   patch '/', :action => 'update'
        #   delete '/', :action => 'destroy'
        # end

        # resources :payload_masking_rules, only: [:create]

        # resources :payload_types, only: [:index]
      end
    end
  end # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
