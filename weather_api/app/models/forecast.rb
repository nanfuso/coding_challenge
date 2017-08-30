class Forecast < ApplicationRecord

    def wunderground__simple_data
        Unirest.get(" #{ENV["API_HOST"]}/#{ENV["API_TOKEN"]}/forecast/q/#{zip_code}").body["forecast"]["simpleforecast"]["forecastday"]["date"]
    end
end
