defmodule SoloroutePublicWeb.UserHomeLive do
  use SoloroutePublicWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
      <div class="px-4 py-36">
        <div class="flex mx-auto h-full w-full items-center justify-center">
          <h1 class="text-3xl font-bold">Welcome, <span class="text-brand"><%= @current_user.email %></span></h1>
        </div>
      </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
