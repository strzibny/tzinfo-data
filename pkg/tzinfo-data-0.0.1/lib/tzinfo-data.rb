$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# Loads Ruby modules containing timezone information
module TZInfo
  module Data
	class << self
	  # Loads countries index
	  def load_country_index
		require 'indexes/countries.rb'
	  end

	  # Loads timezones index
	  def load_timezone_index
		require 'indexes/timezones.rb'
	  end

	  # Loads offsets and transitions for given timezone
	  def load_definition(identifier)
		file = 'definitions' + File::SEPARATOR + identifier
		begin
			require file
		rescue LoadError
			raise InvalidTimezoneIdentifier, 'Invalid identifier'
		end
	  end
	end
  end
end