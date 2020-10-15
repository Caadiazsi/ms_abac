defmodule MsAbac.Abac do
  @moduledoc """
  The Abac context.
  """

  import Ecto.Query, warn: false
  alias MsAbac.Repo

  alias MsAbac.Abac.Role

  @doc """
  Returns the list of roles.

  ## Examples

      iex> list_roles()
      [%Role{}, ...]

  """
  def list_roles do
    Repo.all(Role)
  end

  @doc """
  Gets a single role.

  Raises `Ecto.NoResultsError` if the Role does not exist.

  ## Examples

      iex> get_role!(123)
      %Role{}

      iex> get_role!(456)
      ** (Ecto.NoResultsError)

  """
  def get_role!(id), do: Repo.get!(Role, id)

  @doc """
  Creates a role.

  ## Examples

      iex> create_role(%{field: value})
      {:ok, %Role{}}

      iex> create_role(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_role(attrs \\ %{}) do
    %Role{}
    |> Role.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a role.

  ## Examples

      iex> update_role(role, %{field: new_value})
      {:ok, %Role{}}

      iex> update_role(role, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_role(%Role{} = role, attrs) do
    role
    |> Role.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a role.

  ## Examples

      iex> delete_role(role)
      {:ok, %Role{}}

      iex> delete_role(role)
      {:error, %Ecto.Changeset{}}

  """
  def delete_role(%Role{} = role) do
    Repo.delete(role)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking role changes.

  ## Examples

      iex> change_role(role)
      %Ecto.Changeset{data: %Role{}}

  """
  def change_role(%Role{} = role, attrs \\ %{}) do
    Role.changeset(role, attrs)
  end

  alias MsAbac.Abac.Microservice

  @doc """
  Returns the list of microservices.

  ## Examples

      iex> list_microservices()
      [%Microservice{}, ...]

  """
  def list_microservices do
    Repo.all(Microservice)
  end

  @doc """
  Gets a single microservice.

  Raises `Ecto.NoResultsError` if the Microservice does not exist.

  ## Examples

      iex> get_microservice!(123)
      %Microservice{}

      iex> get_microservice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_microservice!(id), do: Repo.get!(Microservice, id)

  @doc """
  Creates a microservice.

  ## Examples

      iex> create_microservice(%{field: value})
      {:ok, %Microservice{}}

      iex> create_microservice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_microservice(attrs \\ %{}) do
    %Microservice{}
    |> Microservice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a microservice.

  ## Examples

      iex> update_microservice(microservice, %{field: new_value})
      {:ok, %Microservice{}}

      iex> update_microservice(microservice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_microservice(%Microservice{} = microservice, attrs) do
    microservice
    |> Microservice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a microservice.

  ## Examples

      iex> delete_microservice(microservice)
      {:ok, %Microservice{}}

      iex> delete_microservice(microservice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_microservice(%Microservice{} = microservice) do
    Repo.delete(microservice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking microservice changes.

  ## Examples

      iex> change_microservice(microservice)
      %Ecto.Changeset{data: %Microservice{}}

  """
  def change_microservice(%Microservice{} = microservice, attrs \\ %{}) do
    Microservice.changeset(microservice, attrs)
  end

  alias MsAbac.Abac.Request

  @doc """
  Returns the list of requests.

  ## Examples

      iex> list_requests()
      [%Request{}, ...]

  """
  def list_requests do
    Repo.all(Request)
  end

  @doc """
  Gets a single request.

  Raises `Ecto.NoResultsError` if the Request does not exist.

  ## Examples

      iex> get_request!(123)
      %Request{}

      iex> get_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_request!(id), do: Repo.get!(Request, id)

  @doc """
  Creates a request.

  ## Examples

      iex> create_request(%{field: value})
      {:ok, %Request{}}

      iex> create_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_request(attrs \\ %{}) do
    %Request{}
    |> Request.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a request.

  ## Examples

      iex> update_request(request, %{field: new_value})
      {:ok, %Request{}}

      iex> update_request(request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_request(%Request{} = request, attrs) do
    request
    |> Request.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a request.

  ## Examples

      iex> delete_request(request)
      {:ok, %Request{}}

      iex> delete_request(request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_request(%Request{} = request) do
    Repo.delete(request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking request changes.

  ## Examples

      iex> change_request(request)
      %Ecto.Changeset{data: %Request{}}

  """
  def change_request(%Request{} = request, attrs \\ %{}) do
    Request.changeset(request, attrs)
  end

  alias MsAbac.Abac.Permissions

  @doc """
  Returns the list of permission.

  ## Examples

      iex> list_permission()
      [%Permissions{}, ...]

  """
  def list_permission do
    Repo.all(Permissions)
  end

  @doc """
  Gets a single permission.

  Return an empty list if not result.

  ## Examples
    iex> has_permission!(data)
    [%Permissions{}]

    iex> has_permission!(data_error)
    []
  """

  def has_permission!(%{"request_uuid" => request_uuid, "role_uuid" => role_uuid}) do
    result = (from p in Permissions, where: p.request_uuid == ^"#{request_uuid}" and p.role_uuid == ^"#{role_uuid}")
    |> Repo.all()
  end

  @doc """
  Gets a single permissions.

  Raises `Ecto.NoResultsError` if the Permissions does not exist.

  ## Examples

      iex> get_permissions!(123)
      %Permissions{}

      iex> get_permissions!(456)
      ** (Ecto.NoResultsError)

  """

  def get_permissions!(id), do: Repo.get!(Permissions, id)

  @doc """
  Creates a permissions.

  ## Examples

      iex> create_permissions(%{field: value})
      {:ok, %Permissions{}}

      iex> create_permissions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_permissions(attrs \\ %{}) do
    %Permissions{}
    |> Permissions.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a permissions.

  ## Examples

      iex> update_permissions(permissions, %{field: new_value})
      {:ok, %Permissions{}}

      iex> update_permissions(permissions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_permissions(%Permissions{} = permissions, attrs) do
    permissions
    |> Permissions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a permissions.

  ## Examples

      iex> delete_permissions(permissions)
      {:ok, %Permissions{}}

      iex> delete_permissions(permissions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_permissions(%Permissions{} = permissions) do
    Repo.delete(permissions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking permissions changes.

  ## Examples

      iex> change_permissions(permissions)
      %Ecto.Changeset{data: %Permissions{}}

  """
  def change_permissions(%Permissions{} = permissions, attrs \\ %{}) do
    Permissions.changeset(permissions, attrs)
  end
end
