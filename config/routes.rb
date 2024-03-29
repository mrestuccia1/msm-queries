Rails.application.routes.draw do
  
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "director", :action => "get_youngest" })

  get("/directors/eldest", { :controller => "director", :action => "get_oldest" })

  get("/directors", { :controller => "director", :action => "get_all" })

  get("/movies", { :controller => "movie", :action => "get_all" })

  get("/actors", { :controller => "actor", :action => "get_all" })

  get("/directors/:director_id", { :controller => "director", :action => "get_director" })

  get("/movies/:movie_id", { :controller => "movie", :action => "get_movie" })

  get("/actors/:actor_id", { :controller => "actor", :action => "get_actor" })
  
end
