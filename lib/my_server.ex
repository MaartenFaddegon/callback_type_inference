defmodule MyServer do
  use GenServer

  @spec start_link() :: GenServer.on_start
  def start_link() do
    GenServer.start_link(__MODULE__, 0)
  end

  @spec hello(GenServer.server) :: {:world, integer}
  def hello(pid) do
    GenServer.call(pid, :hello)
  end

  def handle_call(:hello, _from, hellos) do
    {:reply, hellos, hellos+1}
  end


end
