defmodule ExtestWeb.PageController do
  use ExtestWeb, :controller

  def hello(conn, params) do
    json(conn, %{message: "hello"})
  end

  def get(conn, %{"key" => key}) do
    value = Extest.get(key)
    json(conn, %{key: key, value: value})
  end

  def put(conn, %{"key" => key, "value" => value}) do
    Extest.put(key, value)
    json(conn, %{key: key, value: value})
  end
end
