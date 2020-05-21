import gleam/string
import gleam/http.{Get, Delete}
import gleam/elli.{Response}

pub fn hello_world() {
  "Hello, from hello_gleam!"
}

fn home() {
  Response(200, [], "Hello, world!")
}

fn greet_jane() {
  Response(200, [], "Jane, so good to see you!")
}

fn greet(name) {
  Response(200, [], string.concat(["Hello, ", name, "!"]))
}

fn reject_delete() {
  Response(405, [], "Sorry, no DELETE requests allowed.")
}

fn not_found() {
  Response(404, [], "Not found")
}

pub fn handle(req) {
  let method = elli.method(req)
  let path = elli.path(req)
  case method, path {
    Get, [] -> home()
    Get, ["hello"] -> greet("world")
    Get, ["hello", "jane"] -> greet_jane()
    Get, ["hello", name] -> greet(name)
    Delete, _ -> reject_delete()
    _, _ -> not_found()
  }
}

pub fn start_link() {
  elli.start_link(3000, handle)
}
