defmodule Extest.Repo do
  use Ecto.Repo,
    otp_app: :extest,
    adapter: Ecto.Adapters.Postgres
end
