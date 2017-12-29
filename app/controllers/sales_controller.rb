class SalesController < ApplicationController
  def index
    # reading parameters
    from = params[:from]
    to = params[:to]
    puts [from, to]

    hash = { "a" => 100, "b" => 200 }
    render json: Sale.calculate_statistics(from, to)
  end
end
