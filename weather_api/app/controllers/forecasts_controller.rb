class ForecastsController < ApplicationController

    def index
        @zip_code = params[:zip_code] || "60604"

        if Forecast.where("zip_code = ? and updated_at <= ?", @zip_code, DateTime.now - 1.hour).length == 0
            @responses = Unirest.get("#{ ENV["API_HOST"]}/#{ ENV["API_TOKEN"] }/forecast/q/#{ @zip_code }.json").body["forecast"]["simpleforecast"]["forecastday"].first(3)
            @responses.each do |response|
                new_forecast = Forecast.new(
                                            zip_code: @zip_code,
                                            day: response["date"]["pretty"],
                                            high: response["high"]["fahrenheit"],
                                            low: response["low"]["fahrenheit"],
                                            description: response["conditions"]
                                            )
                new_forecast.save
            end
            @forecasts = Forecast.where(zip_code: @zip_code)    

        else 
            @forecasts = Forecast.where(zip_code: @zip_code).last(3)
            stale_forecasts = Forecast.where(zip_code: @zip_code).first(3)
            stale_forecasts.each do |stale_forecast|
                stale_forecast.destroy
            end
        end
    end
end
