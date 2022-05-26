require "test_helper"

class WeatherFlowTest < ActionDispatch::IntegrationTest
  test "current" do
    get "http://localhost:3000/weather/current"
    assert_response :success
  end

  test "historical" do
    get "http://localhost:3000/weather/historical"
    assert_response :success
  end

  test "historical/max" do
    get "http://localhost:3000/weather/historical/max"
    assert_response :success
  end

  test "historical/min" do
    get "http://localhost:3000/weather/historical/min"
    assert_response :success
  end

  test "historical/avg" do
    get "http://localhost:3000/weather/historical/avg"
    assert_response :success
  end

  test "by_time" do
    get "http://localhost:3000/weather/by_time/1621823790"
    assert_response :success
  end

  test "health" do
    get "http://localhost:3000/health"
    assert_response :success
  end
end
