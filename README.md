# WEATHER

API for weather statistics. Data source - [AccuWeather APIs](https://developer.accuweather.com/apis).

[**DEMO**]( https://megaweather.herokuapp.com/)

###Endpoints:

***/api-docs*** - Swagger documentation

***/weather/current*** - Current temperature

***/weather/historical*** - Hourly temperature for the last 24 hours

***/weather/historical/max*** - Maximum temperature in 24 hours

***/weather/historical/min*** - Minimum temperature in 24 hours

***/weather/historical/avg*** - Average temperature over 24 hours

***/weather/by_time*** - Looks for the temperature closest to the given timestamp from the available data for the last 24 hours

***/health*** - Backend status

###Change of location

Default city Samara. 
To change, you need to [find required location key](https://developer.accuweather.com/accuweather-locations-api/apis/get/locations/v1/cities/search)
on AccuWeather APIs and paste it into the model code `app/models/weather_samara.rb`:

~~~
  # City area code
  LOCATION_KEY = ...
~~~

###API key change

The application uses on AccuWeather APIs the apikey of the author. But it gets old fast)
To get the apikey, register on [AccuWeather APIs](https://developer.accuweather.com) and create new app.
Then paste apikey into the model code `app/models/weather_samara.rb`:

~~~
  API_KEY_ACCUWEATHER = "..."
~~~

###Configuration

* ruby 3.0.3p157

* Rails 6.1.6

* Database creation 

~~~
$ rake db:create
~~~

* Database initialization

~~~
$ rake db:migrate
~~~

* To run tests

~~~
$ bin/rails test
~~~

* To start local server

~~~
$ bin/rails s
~~~
