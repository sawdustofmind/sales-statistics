class SalesController < ApplicationController
  def index
    # reading parameters
    from = params[:from]
    to = params[:to]

    begin
      render json: Sale.calculate_statistics!(from, to)
    end
    # TODO: create custom Error not to throw system errors to production...
    rescue StandardError
      render json: {:error => $ERROR_INFO }, status: 422
    end
end
