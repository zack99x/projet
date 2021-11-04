defmodule ProjectTimeManager.Management.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/\w+\@\w+\.\w+/)
    |> unique_constraint(:username, name: :my_username_index)
    |> unique_constraint(:email, name: :my_email_index)
  end
end
