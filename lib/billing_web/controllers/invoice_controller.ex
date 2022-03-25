defmodule BillingWeb.InvoiceController do
  use BillingWeb, :controller

  def index(conn, _params) do
    invoices = Billing.list_invoices()
    render(conn, "index.html", invoices: invoices)
  end

  def show(conn, %{"invoice_id" => invoice_id}) do
    invoice =
      invoice_id
      |> String.to_integer()
      |> Billing.get_invoice()

    render(conn, "show.html", invoice: invoice)
  end
end
