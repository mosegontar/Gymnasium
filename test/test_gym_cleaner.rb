require './lib/gymnasium/gym_cleaner'
require 'test/unit'

class TestGymCleaner < Test::Unit::TestCase
  include GymCleaner
  def test_extract_extension
    file = 'foo.rb'

    expect = 'rb'
    result = extract_extension(file)

    assert_equal(result, expect)
  end

  def test_valid_extension
    possible_extensions = [:rb, :py]
    assert_true(valid_ext?('rb'), possible_extensions)
  end

  def test_invalid_extension
    possible_extensions = [:rb, :py]
    assert_false(valid_ext?('txt'), possible_extensions)
  end
end


