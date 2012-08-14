$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'test/unit'
require 'tzinfo'
TZInfo::ZoneinfoTimezoneInfo.zoneinfo_dir = ''

include TZInfo

class TCTimezoneInfo < Test::Unit::TestCase
  
  def test_identifier
    ti = TimezoneInfo.new('Test/Zone')
    assert_equal('Test/Zone', ti.identifier)
  end
end
