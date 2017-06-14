defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn # halt()
  import Phoenix.Controller

  alias Discuss.Router.Helpers
  
  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn # returning conn in a plug for when everything is OK    
    else
      conn
      |> put_flash(:error, "You must be logged in.")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end
end