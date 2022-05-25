require "test_helper"

class WeatherSamarasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_samara = weather_samaras(:one)
  end

  test "should get index" do
    get weather_samaras_url, as: :json
    assert_response :success
  end

  test "should create weather_samara" do
    assert_difference('WeatherSamara.count') do
      post weather_samaras_url, params: { weather_samara: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show weather_samara" do
    get weather_samara_url(@weather_samara), as: :json
    assert_response :success
  end

  test "should update weather_samara" do
    patch weather_samara_url(@weather_samara), params: { weather_samara: {  } }, as: :json
    assert_response 200
  end

  test "should destroy weather_samara" do
    assert_difference('WeatherSamara.count', -1) do
      delete weather_samara_url(@weather_samara), as: :json
    end

    assert_response 204
  end
end
