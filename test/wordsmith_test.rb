require 'test_helper'

class WordsmithTest < Minitest::Test
  include SetupAndTeardown
  def test_configuration_is_configuration_object
    assert_instance_of Wordsmith::Configuration, Wordsmith.configuration
  end

  def test_client_is_client_object
    assert_instance_of Wordsmith::Client, Wordsmith.client
  end
end

class WordsmithTest::ConfigureTest < Minitest::Test
  def test_reset_configuration
    Wordsmith.reset
    config = Wordsmith.configuration
    assert_nil config.token
    assert_equal Wordsmith::Configuration::DEFAULT_URL, config.url
  end
end
