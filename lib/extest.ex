defmodule Extest do
  use GenServer
  require Logger

  def start_link(_args) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    Process.flag(:trap_exit, true)
    {:ok, %{}}
  end

  def get(key) do
    Logger.info("Key retreived: #{inspect(key)}")
    GenServer.call(__MODULE__, {:get, key})
  end

  def put(key, val) do
    Logger.info("Key inserted: #{inspect(key)}")
    GenServer.call(__MODULE__, {:put, key, val})
  end

  def handle_call({:get, key}, _from, state) do
    val = Map.get(state, key)
    {:reply, val, state}
  end

  def handle_call({:put, key, val}, _from, state) do
    {:reply, :ok, Map.put(state, key, val)}
  end

  def terminate(_reason, state) do
    Logger.info("GOING DOWN! STATE: #{inspect(state, pretty: true)}")
    :normal
  end
end
