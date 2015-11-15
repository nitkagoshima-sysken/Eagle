defmodule Eagle.ProblemController do
  use Eagle.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "problem_list.html"
  end

  def show(conn, _params) do
    render conn, "problem.html"
  end

  def submit(conn, _params) do
  end
end
