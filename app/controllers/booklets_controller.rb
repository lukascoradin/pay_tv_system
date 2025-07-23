class BookletsController < ApplicationController
  def index
    @booklets = Booklet.includes(:subscription).all
  end

  def show
    @booklet = Booklet.find(params[:id])
    @invoices = @booklet.subscription.invoices.order(:due_date)
  end
end
