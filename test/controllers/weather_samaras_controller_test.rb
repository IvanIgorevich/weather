require "test_helper"

class WeatherSamarasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_samara = weather_samaras(:one)
  end

  test "current" do
    assert_equal(@weather_samara.body[0]["time"], "2022-05-27T15:58:00+04:00")
  end

  test "correctness of calculations historical_max" do
    assert_equal(@weather_samara.historical_max(@weather_samara.body), 18.6)
  end

  test "correctness of calculations historical_avg" do
    assert_equal(@weather_samara.historical_avg(@weather_samara.body), 13.5)
  end

  test "should be WeatherSamara" do
    assert_instance_of( WeatherSamara, @weather_samara)
  end

  test "should be 404 for wrong timestamp" do
    get "/weather/by_time/8764"
    assert_response :missing
  end
end
