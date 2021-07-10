defmodule ArrowLive.Repo do
  use Ecto.Repo,
    otp_app: :arrow_live,
    adapter: Ecto.Adapters.Postgres
end
