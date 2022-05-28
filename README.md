# WEATHER

API for weather statistics. Data source - [AccuWeather APIs](https://developer.accuweather.com/apis).

Default city Samara. 
To change, you need to [find required location key](https://developer.accuweather.com/accuweather-locations-api/apis/get/locations/v1/cities/search)
on AccuWeather APIs and paste it into the model code `app/models/weather_samara.rb`:

~~~
  # City area code
  LOCATION_KEY = ...
~~~

The application uses on AccuWeather APIs the apikey of the author. But it gets old fast)
To get the apikey, register on [AccuWeather APIs](https://developer.accuweather.com) and create new app.
Then paste it into the model code `app/models/weather_samara.rb`:

~~~
  API_KEY_ACCUWEATHER = "..."
~~~

Endpoints:

/api-docs - **swagger** documentation


/weather/current - Current temperature

/weather/historical - Hourly temperature for the last 24 hours

/weather/historical/max - Maximum temperature in 24 hours

/weather/historical/min - Minimum temperature in 24 hours

/weather/historical/avg - Average temperature over 24 hours

/weather/by_time - Looks for the temperature closest to the given timestamp from the available data for the last 24 hours

/health - Backend status

* ruby 3.0.3p157

* Rails 6.1.6

* Configuration

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

