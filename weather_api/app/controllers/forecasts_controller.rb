class ForecastsController < ApplicationController

    def index
        @zip_code = params[:zip_code] || "60604"
        @forecasts = Forecast.where(zip_code: @zip_code) 
        unless @forecasts.length != 0
            @forecasts = Unirest.get("#{ ENV["API_HOST"]}/#{ ENV["API_TOKEN"] }/forecast/q/#{ @zip_code }.json").body["forecast"]["simpleforecast"]["forecastday"].first(3)
            @forecasts.each do |response|
                forecast = Forecast.new(
                                            zip_code: @zip_code,
                                            day: response["date"]["pretty"],
                                            high: response["high"]["fahrenheit"],
                                            low: response["low"]["fahrenheit"],
                                            description: response["conditions"]
                                            )
                forecast.save
            end
        end
    end
end
