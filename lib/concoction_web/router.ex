defmodule ConcoctionWeb.Router do
  use ConcoctionWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ConcoctionWeb do
    pipe_through :browser 

    get "/"                     , PageController, :index
  end

  scope "/auth", ConcoctionWeb do
    pipe_through :browser

    get "/:provider"            , AuthController, :request
    get "/:provider/callback"   , AuthController, :callback
  end

  scope "/api", ConcoctionWeb do
    pipe_through :api

    post "/polling/test/:id"    , PollingController, :test
    post "/test/"               , TestController, :index
    get  "/test/"               , TestController, :index
    
  end
end
