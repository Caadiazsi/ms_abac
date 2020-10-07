defmodule MsAbacWeb.RequestView do
  use MsAbacWeb, :view
  alias MsAbacWeb.RequestView

  def render("index.json", %{requests: requests}) do
    %{data: render_many(requests, RequestView, "request.json")}
  end

  def render("show.json", %{request: request}) do
    %{data: render_one(request, RequestView, "request.json")}
  end

  def render("request.json", %{request: request}) do
    %{request_uuid: request.request_uuid,
      ms_uuid: request.ms_uuid,
      request_type: request.request_type,
      request_description: request.request_description}
  end
end
