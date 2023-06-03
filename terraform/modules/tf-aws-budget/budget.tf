resource "aws_budgets_budget" "dartsly-budget" {
  name         = "dartsly-budget"
  budget_type  = "COST"
  limit_amount = "5"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  cost_filter {
    name        = "dartsly"
    TagKeyValue = ["project:dartsly"]

  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["bendt@schulz-hamburg.de"]
  }
}
