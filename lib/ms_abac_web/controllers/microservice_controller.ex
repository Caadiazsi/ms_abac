defmodule MsAbacWeb.MicroserviceController do
  use MsAbacWeb, :controller

  alias MsAbac.Abac
  alias MsAbac.Abac.Microservice

  action_fallback MsAbacWeb.FallbackController

  def index(conn, _params) do
    microservices = Abac.list_microservices()
    render(conn, "index.json", microservices: microservices)
  end

  def create(conn, %{"microservice" => microservice_params}) do
    with {:ok, %Microservice{} = microservice} <- Abac.create_microservice(microservice_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.microservice_path(conn, :show, microservice))
      |> render("show.json", microservice: microservice)
    end
  end

  def show(conn, %{"id" => id}) do
    microservice = Abac.get_microservice!(id)
    render(conn, "show.json", microservice: microservice)
  end

  def update(conn, %{"id" => id, "microservice" => microservice_params}) do
    microservice = Abac.get_microservice!(id)

    with {:ok, %Microservice{} = microservice} <- Abac.update_microservice(microservice, microservice_params) do
      render(conn, "show.json", microservice: microservice)
    end
  end

  def delete(conn, %{"id" => id}) do
    microservice = Abac.get_microservice!(id)

    with {:ok, %Microservice{}} <- Abac.delete_microservice(microservice) do
      send_resp(conn, :no_content, "")
    end
  end
end
