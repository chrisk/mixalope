ActionController::Routing::Routes.draw do |map|
  map.resources :samples


  map.root :controller => "pages", :action => "frontpage"

end
