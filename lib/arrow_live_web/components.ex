defmodule ArrowLiveWeb.Components do
  use Phoenix.Component

  def mode_icon(assigns) do
    file =
      Map.get(
        %{
          "red" => "/images/icon-red-line-small.svg",
          "blue" => "/images/icon-blue-line-small.svg",
          "orange" => "/images/icon-orange-line-small.svg",
          "green_b" => "/images/icon-green-line-b-small.svg",
          "green_c" => "/images/icon-green-line-c-small.svg",
          "green_d" => "/images/icon-green-line-d-small.svg",
          "green_e" => "/images/icon-green-line-e-small.svg",
          "mattapan" => "/images/icon-mattapan-line-small.svg",
          "cr" => "/images/icon-mode-commuter-rail-small.svg"
        },
        assigns.mode
      )

    ~H"""
    <img class="h-7 w-7 rounded-full mr-2" src={file} alt="">
    """
  end

  def white_button(assigns) do
    extra_classes = Map.get(assigns, :class, "")

    classes =
      extra_classes <>
        " inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"

    ~H"""
    <button class={classes}>
      <%= render_block(@inner_block) %>
    </button>
    """
  end
end
