defmodule PrimeAgent do
  def start(_type,_args) do
    Agent.start_link(fn -> HashDict.new end, name: __MODULE__)
  end

  def get(num) do
    Agent.get(__MODULE__, fn store -> HashDict.get(store,num) end)
  end

  def add(num) do
    Agent.update(__MODULE__, fn store -> HashDict.put(store, num, true) end)
  end
end
