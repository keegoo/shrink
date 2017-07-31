require 'test_helper'
# require 'minitest/autorun'
require_relative '../../lib/rebase.rb'

class TestRebase < ActiveSupport::TestCase
  test "should convert decimal number into 62 based string by default" do 
    assert_equal '0', Rebase.encode(0)
    assert_equal '1', Rebase.encode(1)
    assert_equal 'Z', Rebase.encode(61)
    assert_equal '10', Rebase.encode(62)
    assert_equal '100', Rebase.encode(62 * 62)
    assert_equal 'ZZ', Rebase.encode(62 * 61 + 61)
    assert_equal 'ZZZ', Rebase.encode(62 * 62 * 61 + 62 * 61 + 61)
    assert_equal '1aB', Rebase.encode(62 * 62 * 1 + 62 * 10 + 11)
  end
end