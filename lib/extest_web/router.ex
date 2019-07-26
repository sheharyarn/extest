defmodule ExtestWeb.Router do
  use ExtestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExtestWeb do
    pipe_through :api

    get "/", PageController, :hello
    get "/get", PageController, :get
    get "/put", PageController, :put
  end
end
