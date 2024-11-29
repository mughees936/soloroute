defmodule SoloroutePublic.Repo do
  use Ecto.Repo,
    otp_app: :soloroute_public,
    adapter: Ecto.Adapters.Postgres
end
