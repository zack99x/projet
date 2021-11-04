defmodule ProjectTimeManager.Repo do
  use Ecto.Repo,
    otp_app: :projectTimeManager,
    adapter: Ecto.Adapters.Postgres
end
