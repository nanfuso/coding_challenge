class ForecastsController < ApplicationController

    def index
        @forecasts = Forecast.all
    end

    def create
        @forecast = Forecast.create(
                                    zip_code: params[:zip_code],
                                    day: wunderground_simple_data["pretty"],
                                    high: wunderground_simple_data["high"]["fahrenheit"],
                                    low: wunderground_simple_data["low"]["fahrenheit"],
                                    description: wunderground_simple_data["icon"]
                                    )
        render :show
    end

    def show
        @forecast = Forecast.find(params[:id])
    end
end
