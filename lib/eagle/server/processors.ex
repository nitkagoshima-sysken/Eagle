defmodule Eagle.Server.Processors do

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(key) do
    Agent.get(__MODULE__, fn processors -> processors[key] end)
  end

  def add(key, value) do
    Agent.update(__MODULE__, fn processors -> Map.put(processors, key, value) end)
  end

end
