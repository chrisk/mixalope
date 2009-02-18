ActionController::Routing::Routes.draw do |map|
  map.resources :sample_usages

  map.resources :drum_machines

  map.resources :samples


  map.root :controller => "pages", :action => "frontpage"

end
