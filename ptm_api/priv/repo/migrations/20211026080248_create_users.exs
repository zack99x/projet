defmodule ProjectTimeManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string

      timestamps()
    end
    create unique_index(:users, :username, name: :my_username_index)
    create unique_index(:users, :email, name: :my_email_index)
  end
end
