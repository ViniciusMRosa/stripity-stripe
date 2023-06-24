defmodule Stripe.FinancialConnections.SessionTest do
  use Stripe.StripeCase, async: true

  describe "create/2" do
    test "create sessions for accounts" do
      params = %{
        account_holder: %{
          account: "acct_123",
          type: "account"
        },
        permissions: ["payment_method", "balances"],
        filters: %{
          countries: ["US"]
        }
      }

      assert {:ok, %{}} = Stripe.FinancialConnections.Session.create(params)

      assert_stripe_requested(:post, "/v1/financial_connections/sessions")
    end
  end

  describe "retrieve/2" do
    test "retrieve session" do
      assert {:ok, %Stripe.FinancialConnections.Session{}} =
               Stripe.FinancialConnections.Session.retrieve("fcsess_123")

      assert_stripe_requested(:get, "/v1/financial_connections/sessions/fcsess_123")
    end
  end
end
