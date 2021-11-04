defmodule ProjectTimeManager.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :utc_datetime
      add :status, :boolean
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:clocks ,[:user_id])
  end
end
