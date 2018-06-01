# Desired GenServer static analysis

Following good OTP practice a GenServer implemenatation defines some API calls that is used by any other process that wants to communicate with our GenServer.

```elixir
@spec hello(GenServer.server) :: {:world, integer}
def hello(pid) do
  GenServer.call(pid, :hello)
end
```

It is also practice to specify in the same module/file how our GenServer handles events from other processes.

```elixir
def handle_call(:hello, _from, hellos) do
  {:reply, hellos, hellos+1}
end
```

Even though we type our API, existing static analysis does not find that the response in our handle_call will never satisfy the return type of hello.


```
$ mix dialyzer
Starting Dialyzer
dialyzer args: [
  check_plt: false,
  init_plt: '/home/user/my_server/_build/dev/dialyxir_erlang-20.2_elixir-1.7.0-dev_deps-dev.plt',
  files_rec: ['/home/user/my_server/_build/dev/lib/my_server/ebin'],
  warnings: [:unknown]
]
done in 0m0.84s
done (passed successfully)
```

See the complete example in lib/my_server.ex

A simple unit test has been included that demonstrates the unexpected behaviour of MyServer

```
$ mix test

  1) test greets the world (MyServerTest)
     test/my_server_test.exs:5
     Assertion with == failed
     code:  assert MyServer.hello(pid) == {:world, 0}
     left:  0
     right: {:world, 0}
     stacktrace:
       test/my_server_test.exs:7: (test)

Finished in 0.03 seconds
1 test, 1 failure
```
