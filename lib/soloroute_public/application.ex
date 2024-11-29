defmodule SoloroutePublic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SoloroutePublicWeb.Telemetry,
      SoloroutePublic.Repo,
      {DNSCluster, query: Application.get_env(:soloroute_public, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SoloroutePublic.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SoloroutePublic.Finch},
      # Start a worker by calling: SoloroutePublic.Worker.start_link(arg)
      # {SoloroutePublic.Worker, arg},
      # Start to serve requests, typically the last entry
      SoloroutePublicWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SoloroutePublic.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SoloroutePublicWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
