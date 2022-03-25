defmodule BillingWeb.PageController do
  use BillingWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
