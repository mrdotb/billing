defmodule Billing do
  alias Billing.Invoice
  alias Billing.Invoice.{Company, Article, Total, PaymentInformation}

  def list_invoices do
    now = DateTime.utc_now()
    %{year: year} = now
    in_30_days = DateTime.add(now, 24 * 3600 * 30, :second)

    [
      %Invoice{
        id: 1,
        title: "Monthly Invoice",
        seller: phoenix_company(),
        client: elixir_company(),
        issued_on: now,
        payment_due_date: in_30_days,
        number: "#{year}-1",
        articles: [
          %Article{
            details: "Development Days",
            qty: 10,
            unit_price: 400,
            vat: 20,
            total_excl_vat: 4000,
            total: 4800
          }
        ],
        total: %Total{
          total_excl_vat: 4000,
          vat_amount: 800,
          total: 4800
        },
        payment_information: payment_information()
      },
      %Invoice{
        id: 2,
        title: "Monthly Invoice",
        seller: phoenix_company(),
        client: elixir_company(),
        issued_on: now,
        payment_due_date: in_30_days,
        number: "#{year}-2",
        articles:
          Enum.map(~w(Jose Bob Michael Baptiste), fn developer ->
            %Article{
              details: "Development days for #{developer}",
              qty: 10,
              unit_price: 400,
              vat: 20,
              total_excl_vat: 4000,
              total: 4800
            }
          end),
        total: %Total{
          total_excl_vat: 4000 * 4,
          vat_amount: 800 * 4,
          total: 4800 * 4
        },
        payment_information: payment_information()
      }
    ]
  end

  def get_invoice(id) do
    Enum.find(list_invoices(), &(&1.id == id))
  end

  defp phoenix_company do
    %Company{
      name: "Phoenix Company",
      logo: "/logo.png",
      address: "10 rue de la truanderie",
      zip_code: "75001",
      city: "Paris",
      country: "France",
      registration_number: "123 456 789",
      vat_number: "FR 12 345 678 912"
    }
  end

  defp elixir_company do
    %Company{
      name: "Elixir Company",
      logo: nil,
      address: "14 Rue Chanoinesse",
      zip_code: "75004",
      city: "Paris",
      country: "France",
      registration_number: "123 456 789",
      vat_number: "FR 12 345 678 912"
    }
  end

  defp payment_information do
    %PaymentInformation{
      bic: "TRZ0FR12345",
      iban: "FR76 1234 5678 9123 4567 8912",
      reference: "sl432432"
    }
  end
end
