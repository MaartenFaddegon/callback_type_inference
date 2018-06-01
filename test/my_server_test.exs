defmodule MyServerTest do
  use ExUnit.Case
  doctest MyServer

  test "greets the world" do
     {:ok, pid} = MyServer.start_link()
    assert MyServer.hello(pid) == {:world, 0}
  end
end
