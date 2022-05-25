class AddBodyToWeatherSamaras < ActiveRecord::Migration[6.1]
  def change
    add_column :weather_samaras, :body, :json
  end
end
