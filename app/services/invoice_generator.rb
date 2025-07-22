class InvoiceGenerator
  def initialize(subscription)
    @subscription = subscription
  end

  def call
    start_due_date = @subscription.created_at.to_date.next_month.change(day: @subscription.created_at.day)

    12.times do |invoice|
      due_date = start_due_date + invoice.months

      accounts_for_due_date = @subscription.billing_accounts.select do |account|
        account.due_date == due_date
      end

      invoice = Invoice.create!(
        subscription: @subscription,
        issued_at: Date.current,
        due_date: due_date,
        value: accounts_for_due_date.sum(&:value)
      )

      accounts_for_due_date.each do |account|
        account.update!(invoice: invoice)
      end
    end
  end
end
