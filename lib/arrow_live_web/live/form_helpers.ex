defmodule ArrowLiveWeb.FormHelpers do
  use Phoenix.Component
  use Phoenix.HTML

  def section(%{title: title} = assigns) do
    ~H"""
    <div>
      <div class="mt-4 text-2xl font-semibold"><%= title %></div>
      <%= render_block(@inner_block) %>
    </div>
    """
  end

  def radios(assigns) do
    ~H"""
    <div>
      <%= for {value, label} <- @labels do %>
        <div>
          <label class="text-xl ml-4">
            <%= radio_button(@form, @name, value, checked: value == @checked) %>
            <%= label %>
          </label>
        </div>
      <% end %>
    </div>
    """
  end

  def date_picker(assigns) do
    ~H"""
    <input type="date" />
    """
  end
end
