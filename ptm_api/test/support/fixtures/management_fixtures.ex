defmodule ProjectTimeManager.ManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectTimeManager.Management` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{

      })
      |> ProjectTimeManager.Management.create_user()

    user
  end

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{

      })
      |> ProjectTimeManager.Management.create_clock()

    clock
  end

  @doc """
  Generate a working_time.
  """
  def working_time_fixture(attrs \\ %{}) do
    {:ok, working_time} =
      attrs
      |> Enum.into(%{

      })
      |> ProjectTimeManager.Management.create_working_time()

    working_time
  end
end
