class BillingAccountsGenerator
  def initialize(subscription)
    @subscription = subscription
  end

  def call
    start_due_date = @subscription.created_at.to_date.next_month.change(day: @subscription.created_at.day)

    12.times do |billing_accounts|
      due_date = start_due_date + billing_accounts.months

      if @subscription.plan.present?
        @subscription.billing_accounts.create!(
          billable: @subscription.plan,
          due_date: due_date,
          value: @subscription.plan.price
        )
      elsif @subscription.package.present?
        @subscription.billing_accounts.create!(
          billable: @subscription.package,
          due_date: due_date,
          value: @subscription.package.price
        )
      end

      if @subscription.plan.present? && @subscription.additional_services.any?
        @subscription.additional_services.each do |service|
          @subscription.billing_accounts.create!(
            billable: service,
            due_date: due_date,
            value: service.price
          )
        end
      end
    end
  end
end
