defmodule ArrowLiveWeb.DisruptionLive do
  use ArrowLiveWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <main>
      <h1>create new disruption</h1>
    </main>
    """
  end
end
