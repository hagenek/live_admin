defmodule LiveAdmin.Components.Session do
  use Phoenix.LiveView

  alias Ecto.Changeset

  @impl true
  def mount(_params, _, socket) do
    mod = get_in(socket.assigns.config, [:components, :session])

    if socket.assigns.session do
      {:ok, assign(socket, changeset: Changeset.change(socket.assigns.session), mod: mod)}
    else
      {:ok, socket}
    end
  end

  @impl true
  def render(assigns = %{changeset: _, mod: _}) do
    ~H"""
    <.live_component module={@mod} id="content" changeset={@changeset} />
    """
  end

  def render(assigns), do: ~H""
end
