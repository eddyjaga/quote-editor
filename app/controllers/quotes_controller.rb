class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('new_quote', partial: 'quotes/form', locals: { quote: @quote }) }
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
