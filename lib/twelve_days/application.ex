defmodule TwelveDays.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    import Supervisor.Spec
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: TwelveDays.UserEndpoint,
        options: Application.get_env(:twelve_days, :endPoint)[:port]
        ),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TwelveDays.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
