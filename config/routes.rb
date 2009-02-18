ActionController::Routing::Routes.draw do |map|
  map.resources :drum_machines, :samples

  map.root :controller => "pages", :action => "frontpage"
end
