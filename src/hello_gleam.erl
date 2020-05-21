-module(hello_gleam).

-behaviour(application).
-behaviour(supervisor).

-export([start/0, start/2, stop/1, init/1]).

start() ->
    start(normal, []).

start(_StartType, _StartArgs) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

stop(_State) ->
    ok.

init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 5},
    ChildSpecs = [
        #{id => "hello_gleam",
          start => {hello_gleam@web, start_link, []},
          restart => permanent,
          shutdown => 2000}
    ],
    {ok, {SupFlags, ChildSpecs}}.
