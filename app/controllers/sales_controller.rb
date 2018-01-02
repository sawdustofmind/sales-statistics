class SalesController < ApplicationController
  def index
    # reading parameters
    from = params[:from]
    to = params[:to]

    begin
      render json: Sale.calculate_statistics!(from, to)
    rescue ArgumentError => e
      render json: {:error => e.message}, status: 422
    end
  end
end
