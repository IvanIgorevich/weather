class RenameWeatherSamaraToTemperature < ActiveRecord::Migration[6.1]
  def change
    rename_table :weather_samaras, :temperatures
  end
end
