defmodule Billing.Invoice do
  defstruct ~w(
    id
    title
    number
    seller
    client
    issued_on
    payment_due_date
    articles
    total
    payment_information
  )a

  @type t :: %__MODULE__{
          id: pos_integer(),
          title: String.t(),
          number: String.t(),
          seller: Company.t(),
          client: Company.t(),
          issued_on: DateTime.t(),
          payment_due_date: DateTime.t(),
          number: String.t(),
          articles: [Article.t()],
          total: Total.t(),
          payment_information: PaymentInformation.t()
        }

  defmodule Company do
    defstruct ~w(
      name
      logo
      address
      zip_code
      city
      country
      registration_number
      vat_number
    )a

    @type t :: %__MODULE__{
            name: String.t(),
            logo: String.t(),
            address: String.t(),
            zip_code: String.t(),
            city: String.t(),
            country: String.t(),
            registration_number: String.t(),
            vat_number: String.t()
          }
  end

  defmodule Article do
    defstruct ~w(
      details
      qty
      unit_price
      vat
      total_excl_vat
      total
    )a

    @type t :: %__MODULE__{
            details: String.t(),
            qty: integer(),
            # I recommand using https://hexdocs.pm/decimal or https://hexdocs.pm/money in a real project
            unit_price: float(),
            vat: float(),
            total_excl_vat: float(),
            total: float()
          }
  end

  defmodule Total do
    defstruct ~w(
      total_excl_vat
      vat_amount
      total
    )a

    @type t :: %__MODULE__{
            # I recommand using https://hexdocs.pm/decimal or https://hexdocs.pm/money in a real project
            total_excl_vat: float(),
            vat_amount: float(),
            total: float()
          }
  end

  defmodule PaymentInformation do
    defstruct ~w(
      bic
      iban
      reference
    )a

    @type t :: %__MODULE__{
            bic: String.t(),
            iban: String.t(),
            reference: String.t()
          }
  end
end
