defmodule MsAbacWeb.MicroserviceView do
  use MsAbacWeb, :view
  alias MsAbacWeb.MicroserviceView

  def render("index.json", %{microservices: microservices}) do
    render_many(microservices |> Enum.map(fn x -> Map.from_struct(x) end), MicroserviceView, "microservice.json")
  end

  def render("show.json", %{microservice: microservice}) do
    render_one(microservice, MicroserviceView, "microservice.json")
  end

  def render("microservice.json", %{microservice: microservice}) do
    %{ms_uuid: microservice.ms_uuid,
      ms_name: microservice.ms_name,
      ms_description: microservice.ms_description}
  end
end
