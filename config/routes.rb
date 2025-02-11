Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "home" })

  get("/:square/:new", { :controller => "application", :action => "square_new"})

  get("/:square_root/:new", { :controller => "application", :action => "square_root_new"})

  get("/:payment/:new", { :controller => "application", :action => "payment_new"})

  get("/:random/:new", { :controller => "application", :action => "random_new"})

end
