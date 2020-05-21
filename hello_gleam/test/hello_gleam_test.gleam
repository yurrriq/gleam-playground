import hello_gleam/web
import gleam/should

pub fn hello_world_test() {
  web.hello_world()
  |> should.equal("Hello, from hello_gleam!")
}
