# {:ok, players} = File.open("lib/worldcupplayerinfo_20140701.tsv", [:read, :write])

# IO.read(players, :all) |> IO.inspect
# IO.read(players, :all) |> IO.inspect
# IO.read(players, :line) |> IO.inspect
# IO.read(players, :line) |> IO.inspect
# IO.read(players, :line) |> IO.inspect

defmodule TodoList do
  @moduledoc """
  Todo list application to work with .csv files through IEx.
  """
  defstruct last_id: 0, todos: %{}

  @path "lib/test.tsv"

  def parse_file do
    @path
    |> read_file!
    |> format_to_work
  end

  defp read_file!(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  defp format_to_work(input) do
    format_todos = fn el, acc ->
      [id, task, date, status] = String.split(el, ",")
      id = String.to_integer(id)
      Map.put(acc, id, %Todo{id: id, task: task, date: date, status: status})
    end

    todos = Enum.reduce(input, %{}, format_todos)
    last_id = Map.keys(todos) |> Enum.max()
    %TodoList{last_id: last_id, todos: todos}
  end
end
