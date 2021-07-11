defmodule ArrowLiveWeb.DisruptionLive do
  use ArrowLiveWeb, :live_view
  alias ArrowLiveWeb.FormHelpers

  @adjustments %{
    subway: ["AlewifeKendall", "ForestHillsOakGrove"],
    commuter_rail: ["NorthStationWestMedford", "LowellWellington"]
  }

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(mode: nil, adjustments: [])}
  end

  @impl true
  def handle_event("validate", %{"form" => %{"mode" => mode}}, socket) do
    {:noreply,
     socket
     |> assign(
       adjustments: Map.get(@adjustments, mode(mode), []),
       mode: mode(mode)
     )}
  end

  def handle_event(_, params, socket) do
    IO.inspect(params, label: "params")
    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <main class="p-8">
      <h1 class="text-5xl">create new disruption</h1>

      <.form let={f} for={:form} url="#" phx-change="validate">
        <FormHelpers.section title="mode">
          <FormHelpers.radios
            form={f}
            name="mode"
            checked={@mode}
            labels={[subway: "Subway", commuter_rail: "Commuter Rail"]}
          />
        </FormHelpers.section>

        <FormHelpers.section title="adjustment location">
          <%= if @adjustments != [] do %>
            <%= select(f, :adjustment, @adjustments) %>
          <% end %>
        </FormHelpers.section>

        <FormHelpers.section title="date range">
          <FormHelpers.date_picker />
        </FormHelpers.section>
      </.form>
    </main>
    """
  end

  def mode("subway"), do: :subway
  def mode("commuter_rail"), do: :commuter_rail
  def mode(_), do: nil
end
