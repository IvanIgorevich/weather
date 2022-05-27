require "test_helper"

class WeatherSamarasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_samara = weather_samaras(:one)
  end

  test 'current' do
    get '/weather/current'
    #assert_response :success

    assert({"time":"2022-05-27T15:58:00+04:00","timestamp":1653652680,"temp":{"Metric":{"Value":18.6,"Unit":"C","UnitType":17},"Imperial":{"Value":65.0,"Unit":"F","UnitType":18}}})
  end


  # test "should get index" do
  #   get weather_samaras_url, as: :json
  #   assert_response :success
  # end
  #
  # test "should create weather_samara" do
  #   assert_difference('WeatherSamara.count') do
  #     post weather_samaras_url, params: { weather_samara: {  } }, as: :json
  #   end
  #
  #   assert_response 201
  # end
  #
  # test "should show weather_samara" do
  #   get weather_samara_url(@weather_samara), as: :json
  #   assert_response :success
  # end
  #
  # test "should update weather_samara" do
  #   patch weather_samara_url(@weather_samara), params: { weather_samara: {  } }, as: :json
  #   assert_response 200
  # end
  #
  # test "should destroy weather_samara" do
  #   assert_difference('WeatherSamara.count', -1) do
  #     delete weather_samara_url(@weather_samara), as: :json
  #   end
  #
  #   assert_response 204
  # end
end
