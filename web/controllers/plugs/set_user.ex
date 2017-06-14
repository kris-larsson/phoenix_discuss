defmodule Discuss.Plugs.SetUser do
  import Plug.Conn # gives assign
  import Phoenix.Controller # gives get_session

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
    # heavy calculations that won't change
  end

  def call(conn, _params) do # _params comes from init
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user) # implicit return of modified conn
      true ->
        assign(conn, :user, nil)
    end
  end
end