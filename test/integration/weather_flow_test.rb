require 'test_helper'

class WeatherFlowTest < ActionDispatch::IntegrationTest
  test 'current' do
    get '/weather/current'
    assert_response :success
  end

  test 'historical' do
    get '/weather/historical'
    assert_response :success
  end

  test 'historical/max' do
    get '/weather/historical/max'
    assert_response :success
  end

  test 'historical/min' do
    get '/weather/historical/min'
    assert_response :success
  end

  test 'historical/avg' do
    get '/weather/historical/avg'
    assert_response :success
  end

  test 'by_time' do
    get 'http://localhost:3000/weather/by_time/1653645040'
    assert_response :success
  end

  test 'health' do
    get '/health'
    assert_response :success
  end
end
