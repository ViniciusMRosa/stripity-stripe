defmodule Stripe.FinancialConnections.Session do
  @moduledoc """
  Work with Stripe Financial Connections Sessions objects.

  You can:

  - Create a financial connections session
  - Retrieve a financial connections session

  Stripe API reference: https://stripe.com/docs/api/financial_connections/sessions
  """

  use Stripe.Entity
  import Stripe.Request

  @plural_endpoint "financial_connections/sessions"

  defstruct [
    :id,
    :object,
    :account_holder,
    :accounts,
    :client_secret,
    :filters,
    :livemode,
    :permissions,
    :return_url
  ]

  @type filters :: %{
          countries: [String.t()]
        }
  @type permissions :: [String.t()]

  @type t :: %__MODULE__{
          id: String.t(),
          object: String.t(),
          client_secret: String.t(),
          account_holder: Stripe.FinancialConnections.Account.account_holder(),
          accounts: Stripe.List.t(Stripe.FinancialConnections.Account.t()),
          filters: filters | nil,
          livemode: boolean(),
          permissions: permissions,
          return_url: String.t() | nil
        }

  @doc """
  Create a financial connections session.
  """
  @spec create(params, Stripe.options()) :: {:ok, t} | {:error, Stripe.Error.t()}
        when params: %{
               required(:account_holder) => %{
                 optional(:account) => Stripe.id(),
                 optional(:customer) => Stripe.id(),
                 required(:type) => String.t()
               },
               required(:permissions) => [String.t()],
               optional(:filters) => %{
                 countries: [String.t()]
               }
             }
  def create(params, opts \\ []) do
    new_request(opts)
    |> put_endpoint(@plural_endpoint)
    |> put_params(params)
    |> put_method(:post)
    |> make_request()
  end

  @doc """
  Retrieve a financial connections session.
  """
  @spec retrieve(Stripe.id() | t, Stripe.options()) :: {:ok, t} | {:error, Stripe.Error.t()}
  def retrieve(id, opts \\ []) do
    new_request(opts)
    |> put_endpoint(@plural_endpoint <> "/#{get_id!(id)}")
    |> put_method(:get)
    |> make_request()
  end
end
