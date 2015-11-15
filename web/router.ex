defmodule Eagle.Router do
  use Eagle.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Eagle do
    pipe_through :browser

    get "/", PageController, :index
    get "/problem/:id", ProblemController, :show
    post "/problem/:id", ProblemController, :submit
  end
end
