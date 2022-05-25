class CreateWeatherSamaras < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_samaras do |t|

      t.timestamps
    end
  end
end
