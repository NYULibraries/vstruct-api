VstructApi::Application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    # /api/... Api::
    namespace :v0 do
      resources :vstructs, shallow: true, only: [:index, :show, :create, :update, :destroy] do
        resources :vclips, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

  # resources :vstructs, shallow: true do
  #   resources :vclips
  # end

  #root 'vstructs#index'
  root 'api/v0/vstructs#index', defaults: {format: 'json'}
end
