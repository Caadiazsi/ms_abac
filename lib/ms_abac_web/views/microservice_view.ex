defmodule MsAbacWeb.MicroserviceView do
  use MsAbacWeb, :view
  alias MsAbacWeb.MicroserviceView

  def render("index.json", %{microservices: microservices}) do
    %{data: render_many(microservices, MicroserviceView, "microservice.json")}
  end

  def render("show.json", %{microservice: microservice}) do
    %{data: render_one(microservice, MicroserviceView, "microservice.json")}
  end

  def render("microservice.json", %{microservice: microservice}) do
    %{ms_uuid: microservice.ms_uuid,
      ms_name: microservice.ms_name,
      ms_description: microservice.ms_description}
  end
end
