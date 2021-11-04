import Config
database_url = System.get_env("DATABASE_URL")
# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :projectTimeManager, ProjectTimeManager.Repo,
  # username: "postgres",
  # password: "postgres",
  # database: "projecttimemanager_test#{System.get_env("MIX_TEST_PARTITION")}",
  # hostname: "localhost",
  url: database_url,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :projectTimeManager, ProjectTimeManagerWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "NxnmCWAZ824OVjjgg8akXb0YZWQsOSm0MnBC+mbcXm5iu76C/IK8pqF8bc/NFWQX",
  server: false

# In test we don't send emails.
config :projectTimeManager, ProjectTimeManager.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
