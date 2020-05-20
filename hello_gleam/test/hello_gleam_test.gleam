import hello_gleam
import gleam/should

pub fn hello_world_test() {
  hello_gleam.hello_world()
  |> should.equal("Hello, from hello_gleam!")
}
