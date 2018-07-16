maps_config = Rails.application.config_for :maps_config

Rails.application.configure do  
	config.maps = ActiveSupport::OrderedOptions.new
	config.maps.api_key = maps_config[:api_key]
	config.maps.zurl = maps_config[:zurl]
	config.maps.zil_key = maps_config[:zil_key]
end