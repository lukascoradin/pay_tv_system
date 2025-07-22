class BookletGenerator
  def initialize(subscription)
    @subscription = subscription
  end

  def call
    invoices = @subscription.invoices.order(:due_date)

    booklet = Booklet.create!(
      subscription: @subscription,
      start_date: invoices.first.due_date,
      end_date: invoices.last.due_date,
      value: invoices.sum(&:value)
    )

    invoices.each do |invoice|
      invoice.update!(booklet: booklet)
    end  
  end
end
