defmodule Stripe.FinancialConnections.Account do
  @moduledoc """
  Work with Stripe Financial Connections Accounts objects.

  This is needed to represent a Account in the Financial Connections Sessions API. Still needs implementation of the actions to be performed on the Account.

  Stripe API reference: https://stripe.com/docs/api/financial_connections/accounts
  """

  use Stripe.Entity

  @plural_endpoint "financial_connections/accounts"

  defstruct [
    :id,
    :object,
    :account_holder,
    :balance,
    :balance_refresh,
    :category,
    :created,
    :display_name,
    :institution_name,
    :last4,
    :livemode,
    :ownership,
    :ownership_refresh,
    :permissions,
    :status,
    :subcategory,
    :supported_payment_method_types
  ]

  @type account_holder :: %{
          account: Stripe.id() | Stripe.Account.t() | nil,
          customer: Stripe.id() | Stripe.Customer.t() | nil,
          type: String.t()
        }

  @type cash :: %{
          available: Stripe.Money.t()
        }

  @type credit :: %{
          used: Stripe.Money.t()
        }

  @type balance :: %{
          as_of: Stripe.timestamp(),
          cash: cash(),
          credit: credit(),
          type: String.t()
        }

  @type refresh :: %{
          last_attempted_at: Stripe.timestamp(),
          status: String.t()
        }

  @type t :: %__MODULE__{
          id: Stripe.id(),
          object: String.t(),
          account_holder: account_holder(),
          balance: balance(),
          balance_refresh: refresh(),
          category: String.t(),
          created: Stripe.timestamp(),
          display_name: String.t(),
          id: Stripe.id(),
          institution_name: String.t(),
          last4: String.t(),
          livemode: boolean(),
          object: String.t(),
          ownership: map(),
          ownership_refresh: refresh(),
          permissions: [String.t()],
          status: String.t(),
          subcategory: String.t(),
          supported_payment_method_types: [String.t()]
        }
end
