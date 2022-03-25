defmodule BillingWeb.Router do
  use BillingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BillingWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :pdf do
    # We use our root layout pdf instead of root
    plug :put_root_layout, {BillingWeb.LayoutView, :pdf}
    # We don't need a layout
    plug :put_layout, false
  end

  scope "/", BillingWeb do
    pipe_through [:browser]

    get "/invoices", InvoiceController, :index
  end

  scope "/", BillingWeb do
    pipe_through [:browser, :pdf]

    # this route will use our root layout pdf and require our pdf.js and pdf.css
    get "/invoices/:invoice_id", InvoiceController, :show
  end
end
