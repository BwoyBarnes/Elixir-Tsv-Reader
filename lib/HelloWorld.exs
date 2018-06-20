IO.puts "Hello world from Elixir"
IO.puts 1 + 2
IO.puts 5 * 5
IO.puts 10 / 2
IO.puts "hellö\nworld"
test = "hello"

add = fn (a, b) -> a + b end

lst = [104, 101, 108, 108, 111]

IO.puts add.(5, 5)

IO.puts(is_function(add))
i "test"


temp = TodoList.init
players = Map.get(temp, :todos)

Map.get(players, 1) # Access element 1