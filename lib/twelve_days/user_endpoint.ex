defmodule TwelveDays.UserEndpoint do
  @moduledoc """
    Returns a verse, range of verses or all the complete Twelve Days song
  """
  use Plug.Router

  # Using Plug.Logger for logging request information
  plug(Plug.Logger)

  # responsible for matching routes
  plug(:match)

  # Using Poison for JSON decoding
  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  #Routes
  get "/song" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, build_reponse(conn.query_params))
  end

  def build_reponse(query_params) do
    case query_params do
      %{"verse" => value} ->
        int_value = value |> String.to_integer()
        %{response: TwelveDays.verse(int_value)}

      %{"verses" => values} ->
        [initial_verse, final_verse] = values |> String.split(",") |> Enum.map(&String.to_integer/1)
        %{response: TwelveDays.verses(initial_verse, final_verse)}

      %{"sing" => _values} ->
        %{response: TwelveDays.sing()}

      %{} ->
        %{response: TwelveDays.sing()}

      true ->
        %{response: TwelveDays.sing()}

    end
    |> Poison.encode!()
  end

  match _ do
    send_resp(conn, 404, "Unknown request :( !")
  end
end
