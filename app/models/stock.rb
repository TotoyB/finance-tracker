class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    begin
      StockQuote::Stock.new(api_key: 'pk_80b42d45c9644b958f58ae7c20158da1')
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
    rescue Exception => e
      return nil
    end
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end
end
