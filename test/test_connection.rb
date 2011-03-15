require 'helper'

class TestConnection < Test::Unit::TestCase
  include Beanstalk

  # Assumes beanstalkd running in localhost default port
  def test_connect
    c = Connection.new('localhost:11300')
    assert c.stats.is_a?(Hash)
  end

  def test_connection_refused
    assert_raise(Errno::ECONNREFUSED){ Connection.new('localhost:11301')}
  end
end
