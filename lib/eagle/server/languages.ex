defmodule Eagle.Server.Languages do

  def start_link() do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get(key) do
    Agent.get(__MODULE__, fn languages -> languages[key] end)
  end

  def add(key, value) do
    Agent.update(__MODULE__, fn languages -> Map.put(languages, key, value) end)
  end

end
