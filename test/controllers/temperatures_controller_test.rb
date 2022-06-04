require "test_helper"

class TemperaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @temperature = temperatures(:one)
  end

  test "current" do
    assert_equal(@temperature.body[0]["time"], "2022-05-27T15:58:00+04:00")
  end

  # check the correctness of the method calculations based on the data from fixtures
  test "correctness of calculations historical_max" do
    assert_equal(@temperature.historical_max(@temperature.body), 18.6)
  end

  # check the correctness of the method calculations based on the data from fixtures
  test "correctness of calculations historical_avg" do
    assert_equal(@temperature.historical_avg(@temperature.body), 13.5)
  end

  test "should be Temperature" do
    assert_instance_of(Temperature, @temperature)
  end

  # if the specified time is more than a day ago, we expect 404
  test "should be 404 for wrong timestamp" do
    get "/weather/by_time/8764"
    assert_response :missing
  end

  # if the passed time is within a day ago, the page should be displayed correctly
  test 'by_time' do
    get "http://localhost:3000/weather/by_time/1653602680"
    assert_response :success
  end
end
