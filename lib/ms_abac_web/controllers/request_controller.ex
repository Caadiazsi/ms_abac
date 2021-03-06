defmodule MsAbacWeb.RequestController do
  use MsAbacWeb, :controller

  alias MsAbac.Abac
  alias MsAbac.Abac.Request

  action_fallback MsAbacWeb.FallbackController

  def index(conn, _params) do
    requests = Abac.list_requests()
    render(conn, "index.json", requests: requests)
  end

  def create(conn, %{"request" => request_params}) do
    with {:ok, %Request{} = request} <- Abac.create_request(request_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.request_path(conn, :show, request))
      |> render("show.json", request: request)
    end
  end

  def show(conn, %{"id" => id}) do
    request = Abac.get_request!(id)
    render(conn, "show.json", request: request)
  end

  def update(conn, %{"id" => id, "request" => request_params}) do
    request = Abac.get_request!(id)

    with {:ok, %Request{} = request} <- Abac.update_request(request, request_params) do
      render(conn, "show.json", request: request)
    end
  end

  def delete(conn, %{"id" => id}) do
    request = Abac.get_request!(id)

    with {:ok, %Request{}} <- Abac.delete_request(request) do
      send_resp(conn, :no_content, "")
    end
  end
end
