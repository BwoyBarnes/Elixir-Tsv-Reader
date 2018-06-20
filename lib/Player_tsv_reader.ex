defmodule PlayerList do
  @moduledoc """
  Todo list application to work with .csv files through IEx.
  """
  defstruct last_id: -1, players: %{}

  @path "lib/players.tsv"

  def parse_players do
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
    format_players = fn el, acc ->
      [id, country, rank, jersey, position, age, selections, club, player, img] = String.split(el, "\t")
      id = String.to_integer(id)
      Map.put(acc, id, %Player{id: id, country: country, rank: rank, jersey: jersey, position: position, age: age, selections: selections, club: club, player: player, img: img})
    end

    players = Enum.reduce(input, %{}, format_players)
    last_id = Map.keys(players) |> Enum.max()

    %PlayerList{last_id: last_id, players: players}
  end
end
