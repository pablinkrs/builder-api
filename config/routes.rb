Rails.application.routes.draw do
  resources :escritorios, except: [:new, :edit]
  resources :entidades, except: [:new, :edit]
  resources :res, except: [:new, :edit]
  resources :actividades, except: [:new, :edit]
  resources :comportamientos, except: [:new, :edit]
  resources :statuses, except: [:new, :edit]
  resources :perfils, except: [:new, :edit]
  devise_for :users
  resources :keditos, except: [:new, :edit]
  resources :asignatura
  resources :niveles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  post 'crearasignatura' => 'asignatura#create'
  post 'seleccionarasignatura' => 'asignatura#index'
  post 'editarasignatura' => 'asignatura#update'
  post 'eliminarasignatura' => 'asignatura#destroy'
  post 'buscarxasignatura' => 'asignatura#find_field'

  post 'editarniveles' => 'niveles#update'
  post 'eliminarniveles' => 'niveles#destroy'
  post 'seleccionarniveles' => 'niveles#index'
  post 'crearniveles' => 'niveles#create'
  post 'buscarxniveles' => 'niveles#find_field'

  post 'editarusuarios' => 'users#update'

  post 'editarusuariosperfil' => 'users#updateperfiles'
  post 'editarusuariosperfilpassword' => 'users#updateperfilespassword'
  post 'eliminarusuarios' => 'users#destroy'
  post 'seleccionarusuarios' => 'users#index'
  post 'crearusuarios' => 'users#create'
  post 'buscarxusuarios' => 'users#find_id'
  post 'campoxusuarios' => 'users#find_field'
  post 'buscarxlistaxperfil' => 'users#buscaxtipoperfil'

  post 'cambiarestructurare' => 'res#updateEstructura'
  post 'editarres' => 'res#update'
  post 'editarreGenerado' => 'res#updateReGenerado'
  post 'eliminarres' => 'res#destroy'
  post 'eliminarre_entidades' => 'res#destroy_re_entidades'
  post 'seleccionarres' => 'res#index'
  post 'crearres' => 'res#create'
  post 'buscarxres' => 'res#find_id'
  post 'buscarxresGeneracion' => 'res#find_field_re_generacion'
  post 'buscarxresplantilla' => 'res#find_id_re_plantilla'
  post 'campoxres' => 'res#find_field'
  post 'editarreDocStoryboard' => 'res#updateDoc'


  post 'seleccionarherramientas' => 'herramientas#index'


  post 'buscarxmultimedia' => 'multimedia#find_id'
  post 'seleccionarmultimedia' => 'multimedia#index'
  post 'campoxmultimedia' => 'multimedia#find_field'
  post 'crearmultimedia' => 'multimedia#create'
  post 'eliminarmultimedia' => 'multimedia#destroy'

  post 'seleccionarplantilla' => 'plantilla#index'
  post 'campoxplantilla' => 'plantilla#find_field'

  post 'seleccionarstatus' => 'statuses#find_all'

  post 'seleccionarcomportamiento' => 'comportamientos#find_all'

  post 'seleccionarescritorio' => 'escritorios#find_all'

  post 'seleccionaractividades' => 'actividades#index'
  post 'campoxactividades' => 'actividades#find_field'


  post 'seleccionarperfiles' => 'perfils#index'

  post 'login' => 'login#login'
  post 'login_perfil' => 'login#login_perfil'
  post 'loginreset' => 'login#resetPassword'

  post 'crearactividades' => 'actividades#create'
  post 'editaractividades' => 'actividades#update'
  post 'eliminaractividades' => 'actividades#delete'

  post 'crearentidades' => 'entidades#create'
  post 'eliminarentidades' => 'entidades#destroy'
  post 'eliminarentidadesRE' => 'entidades#destroy_entidades_re'
  post 'buscarxentidadactividad' => 'entidades#actividadEntidad'
  post 'buscarxentidad' => 'entidades#entidadxid'
  post 'editarentidades' => 'entidades#update'
  post 'editarentidadesDocStoryboard' => 'entidades#updateDoc'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
