defmodule TsvReader.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug Plug.Static,
    at: "/css", from: "lib/tsv_reader/templates/css/"

  plug Plug.Static,
    at: "/img", from: "lib/tsv_reader/templates/img"

  plug Plug.Static,
    at: "/js", from: "lib/tsv_reader/templates/js"

  plug Plug.Static,
    at: "/projects", from: "lib/tsv_reader/templates/projects"

  plug(:match)
  plug(:dispatch)


  # Start of routes
  get "/" do
    players = Map.get(PlayerList.parse_players(), :players)
    # players = Tuple.to_list(players)

    page_contents = EEx.eval_file("lib/tsv_reader/templates/index.html", [players: players])

    # conn
    # |> put_resp_header("content-type", "text/html; charset=utf-8")
    # |> send_file(200, "lib/tsv_reader/templates/index.html")

    # conn
    # |> Plug.Conn.put_resp_content_type("text/html")
    # |> Plug.Conn.send_resp(200, page_contents)

    conn
    |> Plug.Conn.put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_resp(200, page_contents)

  end

  get "/hello" do
    conn |> send_resp(200, "World")
  end

  # Basic example to handle POST requests with a JSON body
  post "/post" do
    {:ok, body, conn} = read_body(conn)
    body = Poison.decode!(body)
    IO.inspect(body)

    conn |> send_resp(201, "created: #{get_in(body, ["message"])}")
  end

  # "Default" route that will get called when no other route is matched
  match _ do
    conn |> send_resp(404, "not found")
  end
end
