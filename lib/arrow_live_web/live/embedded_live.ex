defmodule ArrowLiveWeb.EmbeddedLive do
  use ArrowLiveWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    :timer.send_interval(1_000, :tick)
    {:ok, assign(socket, counter: 0)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    Hi from inside a live component: <%= @counter %>
    """
  end

  @impl true
  def handle_info(:tick, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end
end
